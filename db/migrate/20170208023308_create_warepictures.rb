class CreateWarepictures < ActiveRecord::Migration[5.0]
  def change
    create_table :warepictures do |t|
      t.integer :wareid

      t.timestamps null: false
    end
  end
end
