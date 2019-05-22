class AddPhotoToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :watches, :photo, :string
  end
end
