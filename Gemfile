source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.11'
#gem 'rails', '4.0.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'

  gem 'zurb-foundation', "= 3.2.5"
  # Upgrade from Foundation 4 to Foundation 5
  # gem 'foundation-rails'

  gem 'dynamic_form'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

end

gem 'jquery-rails'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :production do
  gem 'pg'
  gem 'rails_12factor'
#  gem 'therubyracer-heroku', :platform => :ruby
  #gem 'therubyracer'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

gem 'haml'
