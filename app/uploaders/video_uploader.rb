require "streamio-ffmpeg"

class VideoUploader < Shrine

  plugin :derivatives

  Attacher.validate do
    validate_max_size 10 * 1024 * 1024
    validate_mime_type %w[video/mpeg video/mp4 video/quicktime video/x-matroska video/x-flv]
    validate_extension %w[mpeg mpg mp4 mov qt mkv flv]
  end
  
  Attacher.derivatives do |original|
    transcoded = Tempfile.new %w[transcoded .mp4]
    screenshot = Tempfile.new %w[screenshot .jpg]

    movie = ::FFMPEG::Movie.new(original.path)
    movie.transcode(transcoded.path)
    movie.screenshot(screenshot.path)

    { transcoded: transcoded, screenshot: screenshot }
  end

end