class VotesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    current_user.vote(@article)

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.js
    end
  end

  def destroy
    @article = Vote.find(params[:id]).article
    current_user.unvote(@article)

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.js
    end
  end
end
