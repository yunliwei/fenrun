class CreateJoinTableClassificationWare < ActiveRecord::Migration[5.0]
  def change
    create_join_table :classifications, :wares do |t|
      # t.index [:classification_id, :ware_id]
      # t.index [:ware_id, :classification_id]
    end
  end
end
