class CreateIntegraldetaileds < ActiveRecord::Migration[5.0]
  def change
    create_table :integraldetaileds do |t|
      t.integer :user_id
      t.integer :integralnumber
      t.integer :status
      t.string :remarks

      t.timestamps
    end
  end
end
