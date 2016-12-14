class Favorite < ApplicationRecord
  belongs_to :ware
  belongs_to :user
end
