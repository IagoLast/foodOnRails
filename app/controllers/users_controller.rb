class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: current_user.id)
  end

end
