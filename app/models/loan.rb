class Loan < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :student
  belongs_to :user
  belongs_to :books

  validates_presence_of :student_id, :book_id

  
end