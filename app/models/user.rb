class User < ApplicationRecord
  include ProfileImageUploader::Attachment(:profile_image)
end
