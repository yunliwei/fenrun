class Classification < ApplicationRecord
  has_and_belongs_to_many :wares
  has_and_belongs_to_many :busines
end
