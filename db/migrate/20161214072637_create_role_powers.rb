class CreateRolePowers < ActiveRecord::Migration[5.0]
  def change
    create_table :role_powers, id: false do |t|
      t.integer :role_id
      t.integer :power_id

      t.timestamps
    end
  end
end
