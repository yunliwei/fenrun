class CreateWares < ActiveRecord::Migration[5.0]
  def change
    create_table :wares do |t|
      t.integer :classification_id
      t.string :ware
      t.float :price
      t.float :discountprice
      t.integer :salevolume
      t.string :describe
      t.float :stock
      t.float :freight
      t.float :discount
      t.float :baseprice

      t.timestamps
    end
  end
end
