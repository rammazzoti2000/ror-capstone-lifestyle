module ArticlesHelper
  def string_length(string, length)
    string_sanitize = ActionView::Base.full_sanitizer.sanitize(string)
    string_sanitize.length > length ? "#{string_sanitize[0..length]}..." : string_sanitize
  end

  def get_order_1(num)
    num.odd? ? 2 : 1
  end

  def get_order_2(num)
    num.odd? ? 1 : 2
  end

  def parent_order(num)
    if ((num - 1) % 4).zero?
      1 + (num - 1)
    elsif ((num - 2) % 4).zero?
      3 + (num - 2)
    elsif ((num - 3) % 4).zero?
      2 + (num - 3)
    elsif ((num - 4) % 4).zero?
      4 + (num - 4)
    end
  end

  def comment_count(comment)
    if comment.count.positive?
      pluralize(comment.count, 'Comment')
    else
      'No Comment'
    end
  end

  def min_read(article)
    article_sanitize = ActionView::Base.full_sanitizer.sanitize(article)
    (article_sanitize.length / 100).to_i
  end

  def search_info(search, searched_count)
    searched_info = ''
    if searched_count.present?
      searched_info = "Search for \"#{search}\"<br> "
      searched_info += "Result for #{pluralize(searched_count.count, 'article')}"
    else
      searched_info = if search.present?
                        "No search for \"#{search}\""
                      else
                        'Search for something'
                      end
    end
    searched_info.html_safe
  end

  def article_present(article)
    article.any?
  end

  def category_article_limit(article, limit)
    article[0..limit]
  end

  def article_random(article, num)
    article.sample(num)
  end

  def count_all(model)
    model.count
  end

  def get_strftime(model, time_mode)
    model.strftime(time_mode)
  end

  def sort_array(arr)
    arr.max
  end

  def bookmark_form
    if current_user
      render partial: 'bookmark_form', locals: { article: @article }
    else
      link_to bookmarks_path do
        button_tag fa_icon('bookmark'), class: 'vote-button'
      end
    end
  end
end
