class Blogpost < ApplicationRecord
  belongs_to :user
  validates :title, :content, :photo, presence: true
  mount_uploader :photo, PhotoUploader

end
