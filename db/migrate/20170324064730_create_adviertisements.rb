class CreateAdviertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :adviertisements do |t|
      t.string :status
      t.string :link

      t.timestamps
    end
  end
end
