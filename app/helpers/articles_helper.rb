module ArticlesHelper
  def string_length(string, length)
   s = string.length > length ? "#{string[0..length]}..." : string
   s
  end

  def get_order(num)
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

  def comment_count(comment)
    if comment.count.positive?
      pluralize(comment.count, 'Comment')
    else
      'No Comment'
    end
  end

  def min_read(article)
    (article.length / 100).to_i
  end
end
