class PromotionBase
  attr_reader :items, :current_total

  def initialize(items, current_total = nil)
    @items = items
    @current_total = current_total || raw_total
  end

  private

  def raw_total
    @items.map(&:price).inject(0, :+)
  end
end
