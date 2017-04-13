class BestBuy < OpenStruct
  def id
    storeId
  end

  def name
    longName
  end

  def store_type
    storeType
  end

  def self.service
    @service ||= BestBuyService.new
  end

  def self.stores(zip_code)
    response = BestBuy.service.stores(zip_code)
    response["stores"].map do |store_json|
      BestBuy.new(store_json)
    end
  end

  def self.total_stores(zip_code)
    BestBuy.service.stores(zip_code)["total"]
  end
end