class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.float :consumebase
      t.float :memberratio
      t.float :agentratio
      t.float :refereeratio
      t.float :consumemin
      t.float :consumemax
      t.float :consumecash
      t.float :withdrawmin
      t.float :withdrawmax
      t.float :withdrawratio

      t.timestamps
    end
  end
end
