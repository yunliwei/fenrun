class CreateReceiptadds < ActiveRecord::Migration[5.0]
  def change
    create_table :receiptadds do |t|
      t.integer :user_id
      t.string :shouhuoname
      t.string :address
      t.string :phonenumber
      t.integer :isselect

      t.timestamps
    end
  end
end
