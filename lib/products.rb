require 'yaml'

module Products
  PRODUCTS = YAML.load_file(File.join(__dir__, '/seeds/products.yml'))

  def self.find_by_code(code)
    PRODUCTS[code] || {}
  end
end
