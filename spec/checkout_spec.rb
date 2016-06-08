require 'spec_helper'

describe Checkout do
  let(:promotions) { [PromotionCardHolder, PromotionTenOff] }

  context 'checking out 001, 002, 003' do
    it 'returns 66.78' do
      co = Checkout.new(promotions)
      co.scan(Item.new('001'))
      co.scan(Item.new('002'))
      co.scan(Item.new('003'))
      expect(co.total).to eq Money.from_amount(66.78, 'GBP')
    end
  end

  context 'checking out 001, 003, 001' do
    it 'returns 36.95' do
      co = Checkout.new(promotions)
      co.scan(Item.new('001'))
      co.scan(Item.new('003'))
      co.scan(Item.new('001'))
      expect(co.total).to eq Money.from_amount(36.95, 'GBP')

      co.unscan('001')
      expect(co.total).to eq Money.from_amount(29.20, 'GBP')
    end
  end

  context 'checking out 001, 002, 001, 003' do
    it 'returns 73.76' do
      co = Checkout.new(promotions)
      co.scan(Item.new('001'))
      co.scan(Item.new('002'))
      co.scan(Item.new('001'))
      co.scan(Item.new('003'))
      expect(co.total).to eq Money.from_amount(73.76, 'GBP')
    end
  end
end
