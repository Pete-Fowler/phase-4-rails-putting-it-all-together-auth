class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id]
      render json: user, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
  end

  private 

  def user_params 
    params.permit(:username, :password, :image_url, :bio)
  end 
end