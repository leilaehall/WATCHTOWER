class User < ApplicationRecord
  has_many :watches
  has_many :bookings # AS RENTER
  has_many :incoming_bookings, through: :watches, source: :bookings # AS OWNER

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, PhotoUploader
end
