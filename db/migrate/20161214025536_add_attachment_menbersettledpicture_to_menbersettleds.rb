class AddAttachmentMenbersettledpictureToMenbersettleds < ActiveRecord::Migration
  def self.up
    change_table :menbersettleds do |t|
      t.attachment :menbersettledpicture
    end
  end

  def self.down
    remove_attachment :menbersettleds, :menbersettledpicture
  end
end
