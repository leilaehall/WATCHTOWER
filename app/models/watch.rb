class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :watch_image, PhotoUploader
end


