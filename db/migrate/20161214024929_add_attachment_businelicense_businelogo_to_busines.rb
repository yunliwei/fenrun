class AddAttachmentBusinelicenseBusinelogoToBusines < ActiveRecord::Migration
  def self.up
    change_table :busines do |t|
      t.attachment :businelicense
      t.attachment :businelogo
    end
  end

  def self.down
    remove_attachment :busines, :businelicense
    remove_attachment :busines, :businelogo
  end
end
