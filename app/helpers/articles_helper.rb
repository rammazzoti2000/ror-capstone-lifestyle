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

  def parent_order_lg(num)
    if ((num - 1) % 4).zero?
      num + 1
    elsif ((num - 2) % 4).zero?
      num - 1
    elsif ((num - 3) % 4).zero?
      num
    elsif ((num - 4) % 4).zero?
      num
    end
  end

  def parent_order_sm(num)
    if ((num - 1) % 4).zero?
      1
    elsif ((num - 2) % 4).zero?
      3
    elsif ((num - 3) % 4).zero?
      2
    elsif ((num - 4) % 4).zero?
      4
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
      searched_info += "Result for #{pluralize(searched_count.count, 'user')}"
    else
      if search.present?
        searched_info = "No search for \"#{search}\""
      else
        searched_info = 'Search for something'
      end
    end
    searched_info.html_safe
  end
end
