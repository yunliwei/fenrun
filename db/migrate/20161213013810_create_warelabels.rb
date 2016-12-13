class CreateWarelabels < ActiveRecord::Migration[5.0]
  def change
    create_table :warelabels do |t|
      t.integer :waretype_id
      t.string :labelname
      t.float :increaseprice
      t.integer :isselect

      t.timestamps
    end
  end
end
