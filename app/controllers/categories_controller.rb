class CategoriesController < ApplicationController
  def index
    cat = params[:category]
    @category = Category.find_by(name: cat)
  end

  def new
  end

  def show
  end
end
