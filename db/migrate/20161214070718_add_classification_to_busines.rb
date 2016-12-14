class AddClassificationToBusines < ActiveRecord::Migration[5.0]
  def change
    add_column :busines, :classification_id, :integer
  end
end
