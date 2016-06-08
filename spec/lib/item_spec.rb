require 'spec_helper'

describe Item do
  describe '#new' do
    it 'instanciate a product' do
      product = Item.new('111')
      expect(product).to_not be nil
    end
  end
end
