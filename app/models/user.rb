class User < ApplicationRecord
  has_many :watches
  has_many :bookings
  has_many :outgoing_bookings, through: :watches, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, PhotoUploader
end
