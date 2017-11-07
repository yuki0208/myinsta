class Photopost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :comment, presence: true, on: :update
  validates :picture, presence: true, on: :create
end
