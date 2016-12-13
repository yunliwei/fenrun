class CreateMenbersettleds < ActiveRecord::Migration[5.0]
  def change
    create_table :menbersettleds do |t|
      t.string :settledname
      t.string :summary
      t.string :phonenumber
      t.integer :status
      t.string :ramarks

      t.timestamps
    end
  end
end
