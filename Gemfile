source 'https://rubygems.org'
#old
ruby '2.5.1'
#new
ruby File.read('.ruby-version').strip

gem 'rails', '~> 6.1.7.2'
gem 'puma'
gem 'pg'
gem 'figaro'
gem 'jbuilder'
gem 'redis'
gem 'devise'
gem 'omniauth-facebook'
gem 'cloudinary'
gem "attachinary"
gem "jquery-fileupload-rails"
gem "coffee-rails"

gem "geocoder"
gem "gmaps4rails"

source "https://rails-assets.org" do
  gem "rails-assets-underscore"
end

gem 'rails-i18n'
gem 'sassc-rails'
gem 'jquery-rails'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'sprockets-rails'
gem 'font-awesome-sass'
gem 'simple_form'
gem 'autoprefixer-rails'

gem 'momentjs-rails', '~> 2.9',  :github => 'derekprior/momentjs-rails'
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true


group :development, :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'launchy'
  gem 'minitest-reporters'

  gem 'binding_of_caller'
  gem 'better_errors'

  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'
  gem 'listen'
  gem 'spring-watcher-listen'
end

group :production do
  gem 'rails_12factor'
end
