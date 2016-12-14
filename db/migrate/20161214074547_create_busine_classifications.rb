class CreateBusineClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :busine_classifications, id: false do |t|
      t.integer :busines_id
      t.integer :classifications_id

      t.timestamps
    end
  end
end
