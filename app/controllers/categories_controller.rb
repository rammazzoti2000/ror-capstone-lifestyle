class CategoriesController < ApplicationController
  def index
    cat = params[:category]
    @category = Category.find_by(name: cat)
    @categories = Category.all
  end

  def new
  end

  def show
  end
end
