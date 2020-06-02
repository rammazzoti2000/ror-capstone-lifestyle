class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
  end
end
