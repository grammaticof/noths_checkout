require 'money'

class Checkout
  attr_reader :items, :promotional_rules
  DEFAULT_CURRENCY = 'GBP'.freeze

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @items = []
  end

  def scan(item)
    @items.push(item)
  end

  def unscan(code)
    unscan_index = @items.index { |item| item.code == code }
    @items.delete_at(unscan_index) if unscan_index
  end

  def total
    Money.from_amount(discounted_total, DEFAULT_CURRENCY)
  end

  private

  def discounted_total
    discounted = @items.map(&:price).inject(0, :+)

    promotional_rules.each do |promotional_rule|
      promotion = promotional_rule.new(@items, discounted)
      discounted -= promotion.calculate
    end

    discounted
  end
end
