require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'faker'

resource "Users" do
  # A specific endpoint
  post "/users" do
      # Which GET/POST params can be included in the request and what do they do?
      parameter :user, "user hash containing name, email, and password"

      let(:user) { {name:Faker::Name.name.to_s, email: Faker::Internet.email.to_s, password:Faker::Internet.password} }


      example "Creating a new user" do
        explanation "Create a new user"

        do_request

        expect(status).to eq(201)
      end
    end
  end
