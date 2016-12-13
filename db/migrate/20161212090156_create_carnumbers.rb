class CreateCarnumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :carnumbers do |t|
      t.integer :user_id
      t.string :number
      t.integer :isselect

      t.timestamps
    end
  end
end
