class CreateBanners < ActiveRecord::Migration[5.0]
  def change
    create_table :banners do |t|
      t.integer :status
      t.string :link

      t.timestamps
    end
  end
end
