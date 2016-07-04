class Student < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :books, through: :loans
  belongs_to :user

  validates_presence_of :name

end