class RealTop12 < ApplicationRecord
  has_many :misses
  belongs_to :year
end
