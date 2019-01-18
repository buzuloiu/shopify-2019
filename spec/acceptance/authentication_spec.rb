require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Authentications" do
  post "/authenticate" do

    parameter :email, "email of the user to get the token for"
    parameter :password, "password of the user to get the token for"

    let(:user) { create :user }
    let(:email) { user.email }
    let(:password) { 'password' }

    example "Get an auth token" do
      explanation "retrieve an auth token"

      do_request

      expect(status).to eq(200)
    end
  end
end
