class Role < ApplicationRecord
  belongs_to :admin
  belongs_to :power
end
