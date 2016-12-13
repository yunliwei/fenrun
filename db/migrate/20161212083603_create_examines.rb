class CreateExamines < ActiveRecord::Migration[5.0]
  def change
    create_table :examines do |t|
      t.integer :user_id
      t.float :amount
      t.integer :status
      t.string :ramarks

      t.timestamps
    end
  end
end
