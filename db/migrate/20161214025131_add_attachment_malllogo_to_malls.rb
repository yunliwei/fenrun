class AddAttachmentMalllogoToMalls < ActiveRecord::Migration
  def self.up
    change_table :malls do |t|
      t.attachment :malllogo
    end
  end

  def self.down
    remove_attachment :malls, :malllogo
  end
end
