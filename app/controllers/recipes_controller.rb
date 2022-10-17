class RecipesController < ApplicationController
  def index
    user = User.find_by(id: session[:user_id]) 
    if user
      render json: Recipe.all, status: :created
    else
      render json: { errors: ['User is not logged in'] }, status: :unauthorized
    end
  end
end
