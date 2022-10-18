class RecipesController < ApplicationController
  def index
    user = User.find_by(id: session[:user_id])
    if user
      render json: Recipe.all, status: :created
    else
      render json: { errors: ['User is not logged in'] }, status: :unauthorized
    end
  end

  def create 
    user = User.find_by(id: session[:user_id]) 
    if user
      recipe = Recipe.new(recipe_params)
      recipe.user = user
      if recipe.valid? == false
        return render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
      end 
      recipe.save
      render json: recipe, status: :created
    else
      render json: { errors: ['Unauthorized']}, status: :unauthorized
    end
  end 

  private

  def recipe_params 
    params.permit(:title, :instructions, :minutes_to_complete, :user_id)
  end
end