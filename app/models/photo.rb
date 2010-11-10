class Photo < ActiveRecord::Base
  belongs_to :camera
  belongs_to :film
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :albums
end
