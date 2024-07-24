class Api::V1::ProductsController < ApplicationController
  # GET /users
  def index
    render json: Product.all
  end

  # GET /products/:id
  def show
    render json: Product.find(params[:id])
  end
end
