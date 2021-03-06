class Recipe < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 36
  
  has_many :ingredients
  has_many :steps
  has_and_belongs_to_many :photos
  accepts_nested_attributes_for :ingredients, :allow_destroy => true
  accepts_nested_attributes_for :steps, :allow_destroy => true
end
