class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
   respond_to :html, :xml, :json

  def index
    @recipes = Recipe.all
    respond_with(@recipes)
  end

  def show
    respond_with(@recipe)
  end

  def new
    @recipe = Recipe.new
    respond_with(@recipe)
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.author = current_user.name
    @recipe.date_pub = Time.now
    @recipe.save
    respond_with(@recipe)
  end

  def update
    @recipe.update(recipe_params)
    respond_with(@recipe)
  end

  def destroy
    @recipe.destroy
    respond_with(@recipe)
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:category, :cuisine, :dish_type, :gluten_free, :vegetarian, :high_prot, :vegan, :price, :difficult, :time, :name, :short_desc, :desc, :ingredients, :images, :author)
    end
end
