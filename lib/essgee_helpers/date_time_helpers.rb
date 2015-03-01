module EssgeeHelpers
  def date(post)
    type       = post['type']
    day        = day(post)
    week_day   = week_day(post)
    month      = month(post)
    time       = time(post)
    date_class = "class='post-date'"
    time_class = "class='time'"

    case type
    when 'announcement'
      %Q{
        <p><span #{date_class}>#{week_day} #{day} #{month}</span></p>
      }
    else
      %Q{
        <p><span #{date_class}>#{week_day} #{day} #{month} <span #{time_class}>#{time}</span></span></p>
      }
    end
  end

  def month(post)
    DateTime.parse(post['date']).strftime('%^b')
  end

  def day(post)
    DateTime.parse(post['date']).strftime('%-d')
  end

  def week_day(post)
    DateTime.parse(post['date']).strftime('%a')
  end

  def time(post)
    DateTime.parse(post['date']).strftime('%l:%M %p')
  end

end
