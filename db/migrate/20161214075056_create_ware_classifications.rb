class CreateWareClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :ware_classifications, id: false do |t|
      t.integer :wares_id
      t.integer :classifications_id

      t.timestamps
    end
  end
end
