class AddAttachmentPictureToBusinespictures < ActiveRecord::Migration
  def self.up
    change_table :businespictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :businespictures, :picture
  end
end
