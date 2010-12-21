class Camera < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 36
  
  has_many :photos
  
  validates_uniqueness_of :nickname
  def fullName()
    brand+" "+model
  end
end
