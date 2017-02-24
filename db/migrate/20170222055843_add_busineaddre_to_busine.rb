class AddBusineaddreToBusine < ActiveRecord::Migration[5.0]
  def change
    add_column :busines, :busineaddre, :string
  end
end
