source 'http://rubygems.org'

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
  gem 'rails_12factor'
end
