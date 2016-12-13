class CreateBusinesssettleds < ActiveRecord::Migration[5.0]
  def change
    create_table :businesssettleds do |t|
      t.string :name
      t.string :phonenumber
      t.string :summary
      t.integer :status
      t.string :remarks

      t.timestamps
    end
  end
end
