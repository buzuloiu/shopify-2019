require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Products" do
  # A specific endpoint
  get "/api/v1/products" do
      # Which GET/POST params can be included in the request and what do they do?
      parameter :qty_available, "minimum quantity available, returns products with stock equal to or higher than the parameter"

      authentication :basic, :api_key, description: 'auth token for api access', name: 'HEADER_KEY'

      let(:user) { create :user }
      let(:api_key) { JsonWebToken.encode(user_id: user.id) }

      let(:one) { create :product }
      let(:two) { create :product }
      let(:three) { create :product }
      let(:qty_available) { 1 }


      # We can provide multiple examples for each endpoint, highlighting different aspects of them.
      #example "Listing products" do
      #  explanation "Retrieve all of the products. They can be selected by minimum quantity available."

      #  do_request

      #  expect(status).to eq(200)
      #end


      example "Listing products that are in stock" do
        explanation "Retrieve all of the products, pass in the qty_available. Only products with inventory_count equal to or higher than the parameter value will be returned."

        do_request

        expect(status).to eq(200)
      end
    end

  get "/api/v1/products/:id/" do

    authentication :basic, :api_key, description: 'auth token for api access', name: 'HEADER_KEY'

    let(:user) { create :user }
    let(:api_key) { JsonWebToken.encode(user_id: user.id) }

    parameter :id, "id of the product to be shown"

    let(:product) { create :product, :in_stock}
    let(:id) { product.id }

    example "Showing a product" do

      explanation "Show the product with the given product id"

      do_request

      expect(status).to eq(200)
    end
  end

  put "/api/v1/products/:id/purchase" do

    authentication :basic, :api_key, description: 'auth token for api access', name: 'HEADER_KEY'

    let(:user) { create :user }
    let(:api_key) { JsonWebToken.encode(user_id: user.id) }

    parameter :id, "id of the product to purchase"

    let(:product) { create :product, :in_stock }
    let(:id) { product.id }

    example "purchase a product" do

      explanation "purchase the product with the given product id"

      do_request

      expect(status).to eq(200)
    end
  end
end
