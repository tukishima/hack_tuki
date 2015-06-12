module Manipulator
  def polaroidImage(a_img, outputFile = './Polaroid.jpg')
      divX = 3
      divY = 3
      minAngle = -5
      maxAngle = 5
      p "========================="
      p a_img
      # img = Magick::Image.read(file).shift
      img = a_img
      compImage = Magick::ImageList.new
      bImage = Magick::Image.new(img.columns + divX * 23 + 10, img.rows + divY * 23 + 10) {
        self.background_color = "white"
      }
      compImage[0] = bImage

      partWidth = (img.columns / divX).truncate
      partHeight = (img.rows / divY).truncate
      draw = Magick::Draw.new

    # print "img.columns:" << img.columns.to_s << "\n"
    # print "img.rows: " << img.rows.to_s << "\n"
    for l_y in 0..(divY-1)
      for l_x in 0..(divX-1)
        cropSizeW = (l_x == divX-1) ? img.columns - ((divX -1) * partWidth) : partWidth
        cropSizeH = (l_y == divY-1) ? img.rows - ((divY -1) * partHeight) : partHeight
        # p l_x * partWidth, l_y * partHeight, cropSizeW, cropSizeH
        cropImage = img.crop(l_x * partWidth, l_y * partHeight, cropSizeW, cropSizeH) {
          self.background_color = "black"
        }
        cropImage = cropImage.polaroid(rand(10) - 5) {
          self.border_color = "#f8f8ff"
          self.undercolor = "none"
          self.shadow_color = "#202020"
        }
        bImage = bImage.composite(cropImage, (partWidth + 23) * l_x, (partHeight + 23) * l_y, Magick::OverCompositeOp)      
      end
    end
    bImage.format = "JPEG"
    bImage
  end
end