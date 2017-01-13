class AddAlreadyamountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :alreadamount, :float
    add_column :users, :arrear, :float
    add_column :users, :backintegration, :float
  end
end
