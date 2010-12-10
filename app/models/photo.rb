class Photo < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 36
  
  attr_accessor :tagslist
  belongs_to :camera
  belongs_to :film
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :albums
  has_attached_file :image,
    :styles => { :medium => "300x300>", :thumb => "100x100>", :square => "300x300#" , :web =>"1000x1000>"},
    :storage => :googlestorage,
    :bucket => "eatcpcks",
    :path => ":attachment/:id/:style.:extension",
    :google_storage_credentials => "#{RAILS_ROOT}/config/storage.yml"
    
    # Paperclip Validations
    validates_attachment_presence :image
    #validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg']
    validates_attachment_size :image, :less_than => 10.megabytes,
        :message => 'filesize must be less than 10 MegaBytes'
      validates_attachment_content_type :image, :content_type => [ 'image/jpeg' ],
                    :message => 'file must be of filetype .jpeg'


      def set_mime_type(data)
        data.content_type = MIME::Types.type_for(data.original_filename)[0].to_s
        self.image = data
      end
      def previous
        self.class.first(:conditions => ["id > ?", id], :order => "id desc")
      end

      def next
        self.class.first(:conditions => ["id < ?", id], :order => "id asc")
      end
end
