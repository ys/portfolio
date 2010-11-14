class Camera < ActiveRecord::Base
  has_many :photos
  def fullName()
    brand+" "+model
  end
end
