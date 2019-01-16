require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Products" do
  # A specific endpoint
  get "/api/v1/products" do
      # Which GET/POST params can be included in the request and what do they do?
      parameter :qty_available, "minimum quantity available, returns products with stock equal to or higher than the parameter"

      let(:qty_available) { 0 }

      # We can provide multiple examples for each endpoint, highlighting different aspects of them.
      example "Listing products" do
        explanation "Retrieve all of the products. They can be selected by minimum quantity available."

        do_request

        expect(status).to eq(200)
      end
    end

  get "/api/v1/products/:id" do

    # Which GET/POST params can be included in the request and what do they do?
    parameter :id, "id of the product to be shown"

    let(:id) { 1 }

    # We can provide multiple examples for each endpoint, highlighting different aspects of them.
    example "Showing a product" do
      @product = create(:product)

      explanation "Show the product with the given product id"

      do_request

      expect(status).to eq(200)
    end
  end
end
