class Tag < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 36
  
  has_and_belongs_to_many :photos
end
