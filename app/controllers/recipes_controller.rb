class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_autentication, only: [:edit, :update, :destroy]
  
  
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
    if not @recipe.save
      respond_with(@recipe)
    else
      flash[:notice] = "Receta creada con exito"
      redirect_to root_path
    end
  end

  def update
    if not @recipe.update(recipe_params)
      respond_with(@recipe)
    else
      flash[:notice] = "Receta actualizada con exito"
      redirect_to root_path
    end
  end

  def destroy
    @recipe.destroy
      flash[:notice] = "Receta borrada con exito"
    respond_with(@recipe)
  end

  private
    def check_autentication
      if not current_user.id == @recipe.user_id
        redirect_to root_path, :flash => { :alert => "No tienes permiso para eso" }
      end
    end

    def set_recipe
      @recipe = Recipe.find_by id: params[:id]
      @recipe or not_found
    end

    def recipe_params
      params.require(:recipe).permit(:category, :cuisine, :dish_type, :gluten_free, :vegetarian, :high_prot, :vegan, :price, :difficult, :time, :name, :short_desc, :desc, :ingredients, :avatar)
    end

    def not_found
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
end
