module EssgeeHelpers
  def date(post)
    case post['type']
    when 'announcement'
      "<p><span class='post-date'>#{day(post)} #{month(post)}</span></p>"
    else
      "<p><span class='post-date'>#{day(post)} #{month(post)} <span class='time'>#{time(post)}</span></span></p>"
    end
  end

  def month(post)
    DateTime.parse(post['date']).strftime('%^b')
  end

  def day(post)
    DateTime.parse(post['date']).strftime('%-d')
  end

  def time(post)
    DateTime.parse(post['date']).strftime('%l:%M %p')
  end

end
