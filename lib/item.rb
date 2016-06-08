class Item
  attr_reader :name, :code, :currency

  def initialize(code)
    @code = code
    @name = product[:name]
    @price = product[:price]
    @currency = product[:currency]
  end

  private

  def product
    @product ||= Products.find_by_code(code)
  end
end
