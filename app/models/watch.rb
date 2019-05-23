class Watch < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :bookings
  mount_uploader :watch_image, PhotoUploader
 geocoded_by :address
 after_validation :geocode, if: :will_save_change_to_address?


 multisearchable against: [ :watch_brand, :watch_model, :watch_category, :rental_price, :retail_price, :gender, :user_id ]

private

  def search_data
    {
      watch_brand: watch_brand,
      watch_model: watch_model,
      watch_category: watch_category,
      rental_price: rental_price,
      retail_price: retail_price,
      gender: gender,
      user_id: user_id,
    }
  end

 
end


