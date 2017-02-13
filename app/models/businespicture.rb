class Businespicture < ApplicationRecord
  belongs_to :busine

  has_attached_file :picture, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :picture

end
