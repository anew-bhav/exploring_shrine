class VideoUploader < Shrine

  Attacher.validate do
    validate_max_size 10 * 1024 * 1024
    validate_mime_type %w[video/mpeg video/mp4 video/quicktime video/x-matroska video/x-flv]
    validate_extension %w[mpeg mpg mp4 mov qt mkv flv]
  end

end