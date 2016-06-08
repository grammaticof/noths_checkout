class PromotionTenOff < PromotionBase
  def calculate
    current_total >  60 ? ten_off : 0
  end

  private

  def ten_off
    (current_total * 10) / 100
  end
end
