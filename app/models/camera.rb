class Camera < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 36
  
  has_many :photos
  def fullName()
    brand+" "+model
  end
end
