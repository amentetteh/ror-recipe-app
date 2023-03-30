class RecipesController < ApplicationController
  def index
    @user = User.includes(:recipes, :foods)
    @food_counts = @user.map { |user| [user.name, user.foods.count] }
    @food_prices = @user.map { |user| [user.name, user.foods.sum(:price)] }
    @recipes = Recipe.includes(:recipe_foods, :foods).where(public: true).order('created_at DESC')
  end

  def show
    @recipe = Recipe.includes(:foods).find(params[:id])
  end

  def public_allocation
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: params[:recipe][:public])
    redirect_to @recipe
  end

  def destroy_from_form
    @food = Food.find(params[:food_id])
    @food.destroy
    redirect_to foods_path(current_user)
  end
  
end
