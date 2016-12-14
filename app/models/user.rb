class User < ApplicationRecord


  has_many :examines
  has_many :favorites
  has_many :shoppingcars
  has_many :integraldetaileds
  has_many :receiptadds
  has_many :orders
  has_many :carnumbers
  has_many :withdraws
end
