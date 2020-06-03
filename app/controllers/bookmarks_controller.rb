class BookmarksController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    current_user.bookmark(@article)

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.js
    end
  end

  def destroy
    @article = Bookmark.find(params[:id]).article
    current_user.unbookmark(@article)

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.js
    end
  end
end
