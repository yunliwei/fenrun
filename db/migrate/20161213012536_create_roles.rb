class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.integer :admin_id
      t.integer :power_id
      t.string :name

      t.timestamps
    end
  end
end
