class AddReceiptaddIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :receiptadd_id, :integer
  end
end
