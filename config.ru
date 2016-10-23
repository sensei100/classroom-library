require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use BooksController
use UsersController
use StudentsController
use LoansController
run ApplicationController

$stdout.sync = true
