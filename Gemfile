source 'https://rubygems.org'

ruby '2.1.5'

gem "middleman",              "~> 3.3.7"
gem "middleman-livereload",   "~> 3.1.0"
gem "rake"
gem 'haml'
gem "awesome_print"
gem 'activesupport'

group :production do
  gem 'rack-contrib'
  gem 'puma'
end

group :development do
end

group :development, :test do
  gem 'fuubar'
  gem "rspec"
  gem "capybara"
end
