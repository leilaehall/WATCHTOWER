class CreateWatches < ActiveRecord::Migration[5.2]
  def change
    create_table :watches do |t|
      t.string :watch_brand
      t.string :watch_model
      t.string :watch_category
      t.integer :rental_price
      t.integer :retail_price
      t.string :gender
      t.datetime :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
