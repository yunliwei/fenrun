class CreateJoinTablePowerRole < ActiveRecord::Migration[5.0]
  def change
    create_join_table :powers, :roles do |t|
      # t.index [:power_id, :role_id]
      # t.index [:role_id, :power_id]
    end
  end
end
