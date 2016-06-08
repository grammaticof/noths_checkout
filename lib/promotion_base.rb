class PromotionBase
  attr_reader :items, :current_total

  def initialize(items, current_total = nil)
    @items = items
    @current_total = current_total
  end
end
