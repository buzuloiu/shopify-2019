require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Carts" do
  get "/api/v1/carts" do
    example "Listing carts" do
      explanation "Retrieve all of the carts."

      do_request

      expect(status).to eq(200)
    end
  end


  get "/api/v1/carts/:id/" do

    parameter :id, "id of the cart to show"

    let(:cart) { create :cart }
    let(:id) { cart.id }

    example "Show a specific cart by id" do
      explanation "Retrieve a cart by the id param passed."

      do_request

      expect(status).to eq(200)
    end
  end


  post "/api/v1/carts/" do
    example "Creating Carts" do
      explanation "Creates a new cart and returns it to you."

      do_request

      expect(status).to eq(201)
    end
  end

  put "/api/v1/carts/:id/add" do

    parameter :id, "id of the cart to add the product to"
    parameter :product_id, "id of the product to be added"
    parameter :quantity, "quantity of the product to add to cart"

    let(:cart) { create :cart }
    let(:product) { create :product, :in_stock }

    let(:id) { cart.id }
    let(:product_id) { product.id }
    let(:quantity) { product.inventory_count }


    example "Adding an item to a cart" do
      explanation "Adds an item ."

      do_request

      expect(status).to eq(200)
    end
  end


  put "/api/v1/carts/:id/complete" do

    let(:cart) { create :cart }
    let(:id) { cart.id }

    parameter :id, "id of the cart to complete"

    example "Completing Carts" do
      explanation "Completes a and returns it to you."

      do_request

      expect(status).to eq(200)
    end
  end
end
