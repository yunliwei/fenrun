class Warepicture < ApplicationRecord
belongs_to :ware


  has_attached_file :picture, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :shangpinpicture

end
