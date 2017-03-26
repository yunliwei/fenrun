class AddUserIdToLudan < ActiveRecord::Migration[5.0]
  def change
    add_column :ludans, :user_id, :integer
  end
end
