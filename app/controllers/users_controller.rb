class UsersController < ApplicationController
  skip_before_action :authenticate_request

  # POST /users
  def create
    puts user_params
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: api_v1_product_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
