class SearchController < ApplicationController
  def index
    @total_stores = BestBuy.total_stores(zip_code)
    @stores = BestBuy.stores(zip_code)
  end

  def zip_code
    params[:search][:zip_code]
  end
end
