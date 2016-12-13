class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :ware_id
      t.integer :user_id
      t.float :number
      t.float :sum
      t.float :userintegral
      t.integer :state
      t.float :fare
      t.string :ramarks

      t.timestamps
    end
  end
end
