class CreateBusines < ActiveRecord::Migration[5.0]
  def change
    create_table :busines do |t|
      t.string :name
      t.float :salessum
      t.string :phonenumber
      t.datetime :registertime
      t.string :jianjie
      t.timestamps
    end
  end
end
