module ApplicationHelper
  def randomMediumPicture(object)
    if object.photos.size != 0
      object.photos.sort_by{rand}[0].image.url(:medium)
    else
      'blank.jpeg'
    end
  end
end
