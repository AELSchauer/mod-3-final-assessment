class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all.without_dates
  end

  def create
  end

  def update
  end

  def show
  end

  def destroy
  end
end
