require 'money'

class Checkout
  attr_accessor :items
  attr_reader :promotional_rules
  DEFAULT_CURRENCY = 'GBP'.freeze

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @items = []
  end

  def scan(item)
    @items.push(item)
  end

  def unscan(code)
    unscan_index = nil

    @items.each_with_index do |item, index|
      if item.code == code
        unscan_index = index
        break
      end
    end

    @items.delete_at(unscan_index) if unscan_index
  end

  def total
    Money.from_amount(discounted_total, DEFAULT_CURRENCY)
  end

  private

  def raw_total
    @items.map(&:price).inject(0, :+)
  end

  def discounted_total
    total_discount = raw_total

    promotional_rules.each do |promotional_rule|
      promotion = promotional_rule.new(@items, total_discount)
      total_discount -= promotion.calculate
    end

    total_discount
  end
end
