class Item
  attr_reader :name, :code, :price

  def initialize(code)
    @code = code
    @name = product[:name]
    @price = product[:price]
  end

  private

  def product
    @product ||= Products.find_by_code(code)
  end
end
