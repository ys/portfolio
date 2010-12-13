# app/views/photos/feed.atom.builder
atom_feed do |feed|
  feed.title("Do you eat cupcakes")
  feed.updated(@photos.first.updated_at)
 
  for photo in @photos
    next if photo.updated_at.blank?
    feed.entry(photo) do |entry|
      entry.title(photo.name)
      entry.content(image_tag(photo.image.url(:square))+'<br/>'+photo.description, :type => 'html')
      entry.summary(truncate(strip_tags(photo.description), :length => 100))
      entry.updated(photo.updated_at) # needed to work with Google Reader.
      entry.author('Yannick')
    end
  end
end