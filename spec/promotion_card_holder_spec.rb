require 'spec_helper'

describe PromotionCardHolder do
  describe '#calculate' do
    context '2 or more' do
      let(:items) do
        [Item.new('001'), Item.new('002'), Item.new('001')]
      end

      it 'returns 1.50 discount' do
        promotion = PromotionCardHolder.new(items)
        expect(promotion.calculate).to eq 1.50
      end
    end

    context 'none' do
      it 'returns 0' do
        promotion = PromotionCardHolder.new([Item.new('002'), Item.new('003')])
        expect(promotion.calculate).to eq 0
      end
    end
  end
end
