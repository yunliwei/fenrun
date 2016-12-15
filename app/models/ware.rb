class Ware < ApplicationRecord
  has_many :favorites
  has_many :shoppingcars
  has_many :orders
  has_many :waretypes
  has_and_belongs_to_many :classifications

  has_many :warelabels, through: :waretypes

end
