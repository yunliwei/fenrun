class User < ApplicationRecord

  has_attached_file :headpicture, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :headpicture


  has_many :examines
  has_many :favorites
  has_many :shoppingcars
  has_many :integraldetaileds
  has_many :receiptadds
  has_many :orders
  has_many :carnumbers
  has_many :withdraws


  def self.createuser

    user = User.create(username:'whenever',password_digest:'123',email:'123@qq.com')
  end





end
