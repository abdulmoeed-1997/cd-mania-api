class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_user, only: :profile

  def index
    user = User.all
    render json: {
      data: { user: user }
      }, status: :ok
  end

  def profile
    render json: {
      data: { user: current_user }
      }, status: :ok
  end

  # private

  # def set_user
  #   @user = User.find_by(params[:id])
  #   if @user
  #     return @user
  #   else
  #     render json: { messages: "Cannot get User", is_success: false, data: {} }, status: :failure
  #   end
  # end
end
