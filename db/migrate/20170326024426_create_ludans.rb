class CreateLudans < ActiveRecord::Migration[5.0]
  def change
    create_table :ludans do |t|
      t.string :ordernumber
      t.string :warename
      t.string :payment
      t.float :amount
      t.float :servicecharges
      t.string :username
      t.string :name
      t.string :status
      t.string :remark

      t.timestamps
    end
  end
end
