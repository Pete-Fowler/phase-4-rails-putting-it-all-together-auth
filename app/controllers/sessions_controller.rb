class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id]
      render json: user
    else
      render json: { errors: ['Username or password incorrect'] }, status: :unauthorized
    end
  end
end
