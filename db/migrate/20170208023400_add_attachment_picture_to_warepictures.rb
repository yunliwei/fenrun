class AddAttachmentPictureToWarepictures < ActiveRecord::Migration
  def self.up
    change_table :warepictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :warepictures, :picture
  end
end
