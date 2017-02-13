class Busine < ApplicationRecord
  has_attached_file :businelicense, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :businelicense

  has_attached_file :businelogo, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :businelogo

  has_and_belongs_to_many :classifications
  has_many :businespictures,dependent: :destroy

end
