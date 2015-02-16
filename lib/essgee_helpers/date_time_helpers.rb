module EssgeeHelpers
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
