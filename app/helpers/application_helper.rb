module ApplicationHelper
  def rotateImage(degrees)
    rotate = ""
     if degrees == 0
       rotate = ''
     elsif degrees == 90
       rotate = 'rotate90'
     elsif degrees == 180
       rotate = 'rotate180'
     elsif degrees == 270
       rotate = 'rotate270'
     end
     return rotate
  end
end
