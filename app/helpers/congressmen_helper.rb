module CongressmenHelper
  def stat_diff(first, second)
    if second.to_i > first.to_i
      "#{first} (<span class='increased'>#{second}</span>)".html_safe
    elsif first.to_i > second.to_i
      "#{first} (<span class='decreased'>#{second}</span>)".html_safe
    else
      "#{first}"
    end
  end
end