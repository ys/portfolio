class Album < ActiveRecord::Base
  has_and_belongs_to_many :photos
  accepts_nested_attributes_for :photos
end
