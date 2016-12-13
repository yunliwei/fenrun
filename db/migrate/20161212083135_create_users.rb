class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :referee_id
      t.string :name
      t.string :username
      t.string :password_digest
      t.integer :sex
      t.string :phonenumber
      t.datetime :birthday
      t.integer :age
      t.string :email
      t.string :wecharnumber
      t.string :refereenumber
      t.string :menber
      t.string :localarea
      t.integer :state
      t.float :canuserebate
      t.datetime :codetime
      t.string :code
      t.float :rebate
      t.float :summationamount

      t.timestamps
    end
  end
end
