require 'spec_helper'

describe PromotionTenOff do
  describe '#calculate' do
    context 'total > 60' do
      let(:items) do
        [Item.new('001'), Item.new('002'), Item.new('003')]
      end

      it 'returns 10% of the sum' do
        promotion = PromotionTenOff.new(items)
        expect(promotion.calculate).to eq 7.42
      end
    end

    context 'total <= 60' do
      it 'returns 0' do
        promotion = PromotionTenOff.new([Item.new('001')])
        expect(promotion.calculate).to eq 0
      end
    end
  end
end
