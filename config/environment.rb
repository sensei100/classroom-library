ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

if development?
  set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
  }
else
   set :database, ENV['SINATRA_ENV']
end
require 'rack-flash'
require_all 'app'
