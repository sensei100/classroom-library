class Loan < ActiveRecord::Base

  belongs_to :student
  belongs_to :user
  belongs_to :books

  
end