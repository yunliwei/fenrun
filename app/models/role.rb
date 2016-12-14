class Role < ApplicationRecord
  belongs_to :admin
  has_and_belongs_to_many :powers
end
