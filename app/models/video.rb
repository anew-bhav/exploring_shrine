class Video < ApplicationRecord
  include VideoUploader::Attachment.new(:video)
  belongs_to :user
end
