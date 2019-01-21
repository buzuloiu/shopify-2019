class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy, :purchase]

  # GET /products
  def index
    #@products = Product.all
    @products = Product.qty_available(params[:qty_available]).by_product(params[:id])


    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: api_v1_product_url(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  # PUT /products/1/purchase
  def purchase
    @product = Product.find(params[:id])
    if @product.purchase
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:title, :price, :inventory_count, :in_stock)
    end
end
