class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password

  has_many :students
  has_many :books
  has_many :loans
  
end