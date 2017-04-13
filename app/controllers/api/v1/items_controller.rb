class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all.without_dates
  end

  def create
  end

  def update
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    render json: Item.find(params[:id]).destroy, status: 204
  end
end
