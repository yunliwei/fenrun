class CreateShoppingcars < ActiveRecord::Migration[5.0]
  def change
    create_table :shoppingcars do |t|
      t.integer :ware_id
      t.integer :user_id
      t.string :spec
      t.float :number
      t.string :remarks

      t.timestamps
    end
  end
end
