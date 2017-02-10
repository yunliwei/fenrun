class AddWareIdToWarepicture < ActiveRecord::Migration[5.0]
  def change
    add_column :warepictures, :ware_id, :integer
  end
end
