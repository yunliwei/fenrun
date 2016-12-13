class CreateMalls < ActiveRecord::Migration[5.0]
  def change
    create_table :malls do |t|
      t.integer :mallname
      t.string :descripte
      t.string :telephone
      t.string :storerecruit
      t.string :customerservice

      t.timestamps
    end
  end
end
