class Ware < ApplicationRecord
  has_many :favorites
  has_many :shoppingcars
  has_many :orders
  has_many :classifications
  has_many :waretypes
end
