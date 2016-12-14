class AddAttachmentHeadpictureToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :headpicture
    end
  end

  def self.down
    remove_attachment :users, :headpicture
  end
end
