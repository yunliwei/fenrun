class Ware < ApplicationRecord
  has_many :favorites
  belongs_to :shoppingcar
  has_many :orders
  has_many :waretypes
  has_and_belongs_to_many :classifications

  has_many :warelabels, through: :waretypes


  has_attached_file :warepicture, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :warepicture

end
