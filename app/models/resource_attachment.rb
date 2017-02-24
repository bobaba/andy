class ResourceAttachment < ApplicationRecord
  mount_uploader :picture, PictureUploader
   belongs_to :resource, dependent: :destroy
end
