class Book < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :user
  has_many :loans
  has_many :students, through: :loans
  
  validates_presence_of :name, :author, :genre
  
end