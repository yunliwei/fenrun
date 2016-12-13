class CreateWaretypes < ActiveRecord::Migration[5.0]
  def change
    create_table :waretypes do |t|
      t.integer :ware_id
      t.string :typename

      t.timestamps
    end
  end
end
