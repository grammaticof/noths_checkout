require_relative './item'

class PromotionCardHolder < PromotionBase
  ITEM_CODE = '001'.freeze # Travel Card Holder
  ITEM_MIN = 2
  PRICE_DROP = 8.50

  def calculate
    items_to_discount.size >= ITEM_MIN ? discount : 0
  end

  def items_to_discount
    @items_to_discount ||= items.select { |item| item.code == ITEM_CODE }
  end

  private

  def discount
    total_old_price - total_new_price
  end

  def total_old_price
    items_to_discount.map(&:price).inject(0, :+)
  end

  def total_new_price
    items_to_discount.size * PRICE_DROP
  end
end
