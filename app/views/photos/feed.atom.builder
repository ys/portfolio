# app/views/photos/feed.atom.builder
atom_feed do |feed|
  feed.title("Do you eat cupcakes")
  feed.updated(@photos.first.updated_at)
 
  for photo in @photos
    next if photo.updated_at.blank?
    feed.entry(photo) do |entry|
      entry.title(photo.name)
      entry.content(image_tag(photo.image.url(:square)), :type => 'html')
      entry.summary(photo.description)
      entry.updated(photo.updated_at) # needed to work with Google Reader.
      entry.author do |author|
        author.name('Yannick')
      end
    end
  end
end