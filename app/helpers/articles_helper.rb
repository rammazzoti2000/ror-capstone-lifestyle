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
end
