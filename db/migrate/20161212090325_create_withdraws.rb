class CreateWithdraws < ActiveRecord::Migration[5.0]
  def change
    create_table :withdraws do |t|
      t.integer :user_id
      t.float :amount
      t.integer :status

      t.timestamps
    end
  end
end
