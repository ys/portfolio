module ApplicationHelper
  def randomMediumPicture(object)
    if object.photos.size != 0
      object.photos.sort_by{rand}[0].image.url(:square)
    else
      'blank.jpeg'
    end
  end
  
  def yield_for(content_sym, default)
      output = content_for(content_sym)
      output = default if output.blank?
      output
    end
end
