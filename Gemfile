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
gem 'devise', '~> 4.8.1'
gem 'omniauth-facebook'
gem 'cloudinary'
gem "attachinary"
gem "jquery-fileupload-rails"
gem "coffee-rails", '~> 5.0.0'

gem "geocoder"
gem "gmaps4rails"

source "https://rails-assets.org" do
  gem "rails-assets-underscore"
end

gem 'rails-i18n', '~> 7.0.5'
gem 'sassc-rails'
gem 'jquery-rails', '~> 4.5.0'
gem 'uglifier'
gem 'bootstrap-sass', '~> 3.4.1' 
gem 'font-awesome-sass', '~> 6.2.0'
gem 'simple_form', '~> 5.2.0', github: 'plataformatec/simple_form'
gem 'autoprefixer-rails'

gem 'momentjs-rails'
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
  gem 'spring', '~> 2.1.1'
  gem 'listen', '~> 3.7.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :production do
  gem 'rails_12factor'
end
