class Student < ActiveRecord::Base

  has_many :books, through: :loans
  belongs_to :user

end