class Film < ActiveRecord::Base
  has_many :photos
  def fullName()
    brand+" "+name
  end
end
