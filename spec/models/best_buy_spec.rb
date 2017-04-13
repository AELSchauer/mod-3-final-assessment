require 'rails_helper'

describe BestBuy do
  describe '#self.service' do
    it 'returns a BestBuyService object' do
      expect(BestBuy.service.class).to eq(BestBuyService)
    end
  end

  describe '#self.stores' do
    it 'returns a list of BestBuy objects populated by the api query' do
      VCR.use_cassette("80020") do
        stores = BestBuy.stores("80202")
        store = stores.first

        expect(stores.count).to eq(10)
        expect(store.id).to eq(2740)
        expect(store.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
        expect(store.city).to eq("DENVER")
        expect(store.distance).to eq(3.45)
        expect(store.phone).to eq("303-270-9189")
        expect(store.store_type).to eq("Mobile SAS")
      end
    end
  end

  describe '#self.total_stores' do
    it 'returns the total number of stores in a 25 mile radius of the given zip code' do
      VCR.use_cassette("80020") do
        total = BestBuy.total_stores("80202")
        expect(total).to eq(16)
      end
    end
  end
end