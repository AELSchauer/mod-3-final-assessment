require 'rails_helper'

describe BestBuyService do
  describe '#stores' do
    it 'returns a list of stores' do
      VCR.use_cassette("80020") do
        service = BestBuyService.new
        request = service.stores("80202")

        expect(request["total"]).to eq(16)
        expect(request["stores"].count).to eq(10)
      end
    end
  end
end