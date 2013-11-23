source 'https://rubygems.org'

gem 'rails', '3.2.15'
ruby "1.9.3"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


group :production do
  gem 'pg'
  gem 'rails_12factor'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'foundation-rails'
  gem 'font-awesome-sass'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'foreman'

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'jazz_hands'
  gem 'quiet_assets'
  gem 'figaro'
end


gem "haml", ">= 3.1.6"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "kaminari"
gem "therubyracer", :group => :assets, :platforms => :ruby

gem 'community_engine'
gem 'omniauth-facebook'
