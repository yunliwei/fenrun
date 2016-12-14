class AddAttachmentWarepictureToWares < ActiveRecord::Migration
  def self.up
    change_table :wares do |t|
      t.attachment :warepicture
    end
  end

  def self.down
    remove_attachment :wares, :warepicture
  end
end
