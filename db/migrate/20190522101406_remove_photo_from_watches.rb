class RemovePhotoFromWatches < ActiveRecord::Migration[5.2]
  def change
    remove_column :watches, :photo, :string
  end
end
