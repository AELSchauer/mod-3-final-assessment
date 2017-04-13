class BestBuyService
  def initialize
    @base_url = "https://api.bestbuy.com/v1"
  end

  def stores(zip_code)
    response = HTTParty.get("https://api.bestbuy.com/v1/stores((area(#{zip_code},25)))?format=json&show=storeId,longName,city,distance,phone,storeType&apiKey=#{ENV['api_key']}")
    JSON.parse(response.body)
  end
end