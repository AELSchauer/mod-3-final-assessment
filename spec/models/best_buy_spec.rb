require 'rails_helper'

describe BestBuy do
  describe '#self.service' do
    it 'returns a BestBuyService object' do
      expect(BestBuy.service.class).to eq(BestBuyService)
    end
  end
end