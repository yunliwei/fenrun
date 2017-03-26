class AddBalanceToBusine < ActiveRecord::Migration[5.0]
  def change
    add_column :busines, :balance, :float
  end
end
