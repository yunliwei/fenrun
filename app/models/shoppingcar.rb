class Shoppingcar < ApplicationRecord
  has_many :ware
  belongs_to :user
end
