require 'kramdown'

module EssgeeHelpers
  def content(post)
    md = post['md'].join('')
    Kramdown::Document.new(md).to_html
  end

  def header(post)
    header = post['type'].capitalize
    "<p>#{header}</p>"
  end
end
