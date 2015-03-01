require 'kramdown'

module EssgeeHelpers
  def content(post)
    md = post['md'].join("\n\n")
    Kramdown::Document.new(md).to_html
  end
end
