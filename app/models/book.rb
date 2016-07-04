class Book < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :user
  validates_presence_of :name, :author, :genre
  
end