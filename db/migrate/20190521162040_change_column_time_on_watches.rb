class ChangeColumnTimeOnWatches < ActiveRecord::Migration[5.2]
  def change
    change_column :watches, :availability_start, :date
    change_column :watches, :availability_end, :date
  end
end
