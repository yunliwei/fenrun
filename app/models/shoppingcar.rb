class Shoppingcar < ApplicationRecord
  has_many :wares
  belongs_to :user
end
