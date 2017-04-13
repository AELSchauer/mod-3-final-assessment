class BestBuy < OpenStruct
  def self.service
    @service ||= BestBuyService.new
  end

  def self.stores(zip_code)
    response = @service.stores(zip_code)
    response["stores"].map do |store_json|
      BestBuy.new(store_json)
    end
  end
end