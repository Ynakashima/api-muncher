class PagesController < ApplicationController

  def search
    @recipe = params[:label]
  end

  def index
    @recipe = params[:label]
    @recipes = Recipe.search(@recipe)
  end

  def show
    @recipe = params[:id]
    @this_recipe = Recipe.by_id(@recipe.id)
  end
end
