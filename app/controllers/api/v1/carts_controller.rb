require 'date'

class Api::V1::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy, :complete, :add_to_cart]

  # GET /carts
  def index
    @carts = Cart.all

    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # POST /carts
  def create
    @cart = Cart.new()

    if @cart.save
      render json: @cart, status: :created, location: api_v1_product_url(@cart)
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  # PUT /carts/1/add/:product_id
  def add_to_cart
    @product_id = params[:product_id]
    @quantity = params[:quantity]
    if @cart.add_to_cart(@product_id, @quantity)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end


  def complete
    if @cart.complete
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.require(:cart).permit(:total, :completed_at)
    end
end
