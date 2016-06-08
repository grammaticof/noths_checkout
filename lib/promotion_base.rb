class PromotionBase
  attr_reader :items, :total

  def initialize(items)
    @items = items
  end

  def total
    @total = raw_total
  end

  private

  def raw_total
    items.map(&:price).inject(0, :+)
  end
end
