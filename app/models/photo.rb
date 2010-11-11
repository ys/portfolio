class Photo < ActiveRecord::Base
  belongs_to :camera
  belongs_to :film
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :albums
  has_attached_file :image,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :storage => :googlestorage,
    :bucket => "eatcpcks",
    :path => ":attachment/:id/:style.:extension",
    :google_storage_credentials => "#{RAILS_ROOT}/config/storage.yml"
end
