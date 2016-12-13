class CreateAgentapps < ActiveRecord::Migration[5.0]
  def change
    create_table :agentapps do |t|
      t.string :applyname
      t.string :phonenumber
      t.string :summary
      t.integer :status
      t.string :remarks

      t.timestamps
    end
  end
end
