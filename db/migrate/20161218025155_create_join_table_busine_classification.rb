class CreateJoinTableBusineClassification < ActiveRecord::Migration[5.0]
  def change
    create_join_table :busines, :classifications,id:false do |t|
      # t.index [:busine_id, :classification_id]
      # t.index [:classification_id, :busine_id]
    end
  end
end
