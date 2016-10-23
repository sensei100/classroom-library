source 'http://rubygems.org'

ruby '2.3.1'
gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'
gem 'heroku'



group :development, :test do
  gem 'rspec'
  gem 'capybara'
  gem 'sqlite3'
  gem 'pry'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :production do
  gem 'pg'
end
