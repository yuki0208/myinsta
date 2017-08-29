class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :comment, presence: true, on: :update
end
