class VotesController < ApplicationController
  before_action :logged_in_user_for_vote, only: [:index]
  before_action :logged_in_user, except: [:index]

  def index
  end

  def create
    @article = Article.find(params[:article_id])
    current_user.vote(@article)

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.js
    end

    @category_priority = @article.category
    @category_priority.increment!(:priority)
  end

  def destroy
    @article = Vote.find(params[:id]).article
    current_user.unvote(@article)

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.js
    end

    @category_priority = @article.category
    @category_priority.decrement!(:priority)
  end

  private

  def logged_in_user_for_vote
    unless logged_in?
      flash['alert-danger'] = 'You must be logged in to upvote an article!'
      redirect_to(request.referer)
    end
  end
end
