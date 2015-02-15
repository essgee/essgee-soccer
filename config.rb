require 'awesome_print'

set  :css_dir,        'stylesheets'
set  :js_dir,         'javascripts'
set  :images_dir,     'images'
set  :fonts_dir,      'fonts'

sprockets.append_path 'javascripts/lib'
sprockets.append_path 'javascripts/vendor'

sprockets.append_path 'stylesheets/lib'
sprockets.append_path 'stylesheets/vendor'

sprockets.append_path File.join root, 'foundation/js/foundation'
asset_paths = sprockets.append_path File.join root, 'foundation/scss'

puts
puts '== Asset paths'
puts
ap   asset_paths
puts

activate   :directory_indexes

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

helpers do
  def month(post)
    post.month
  end

  def day(post)
    post.day
  end

  def title(post)
    post.title
  end

  def copy(post)
    post.copy
  end

  def featured(post)
    post.featured
  end

  def created_at(post)
    post.created_at
  end

  def updated_at(post)
    post.updated_at
  end
end








