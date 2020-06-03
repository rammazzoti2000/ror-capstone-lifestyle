class StaticPagesController < ApplicationController

  def home
    @articles = Article.all_published_articles
    @categories = Category.all
  end
end
