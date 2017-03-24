class AddAttachmentImageToAdviertisements < ActiveRecord::Migration
  def self.up
    change_table :adviertisements do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :adviertisements, :image
  end
end
