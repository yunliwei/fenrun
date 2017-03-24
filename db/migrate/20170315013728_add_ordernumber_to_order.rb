class AddOrdernumberToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :ordernumber, :string
  end
end
