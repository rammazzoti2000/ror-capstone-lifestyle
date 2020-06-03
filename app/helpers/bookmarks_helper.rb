module BookmarksHelper
  def bookmark_form
    if logged_in?
      if current_user.bookmarked?(@article)
        render partial: 'articles/unbookmark', locals: {article: @article}
      else
        render partial: 'articles/bookmark', locals: {article: @article}
      end
    end
  end
end
