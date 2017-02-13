class CreateBusinespictures < ActiveRecord::Migration[5.0]
  def change
    create_table :businespictures do |t|
      t.string :busine_id

      t.timestamps
    end
  end
end
