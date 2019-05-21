class ChangeWatchAvailabilityToRange < ActiveRecord::Migration[5.2]
  def change
    change_table :watches do |t|
      t.remove :availability
      t.datetime :availability_start
      t.datetime :availability_end
      t.string :watch_image
    end
  end
end
