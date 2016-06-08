class PromotionTenOff < PromotionBase
  def calculate
    total >  60 ? ten_off : 0
  end

  private

  def ten_off
    (total * 10) / 100
  end
end
