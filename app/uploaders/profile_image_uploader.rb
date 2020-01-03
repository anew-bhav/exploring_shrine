require 'image_processing/mini_magick'

class ProfileImageUploader < Shrine

  plugin :determine_mime_type
  plugin :derivatives

  Attacher.validate do
    validate_max_size 5 * 1024 * 1024
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_extension %w[jpg jpeg png webp tiff tif]
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      small: magick.resize_to_limit!(300, 300),
      medium: magick.resize_to_limit!(500, 500),
      large: magick.resize_to_limit!(800, 800)
    }
  end
end