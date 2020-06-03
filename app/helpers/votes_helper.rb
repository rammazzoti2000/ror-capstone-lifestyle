module VotesHelper
  def vote_form
    if logged_in?
      if current_user.voted?(@article)
        render partial: 'articles/downvote', locals: {article: @article}
      else
        render partial: 'articles/vote', locals: {article: @article}
      end
    end
  end
end
