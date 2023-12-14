class RealTop5 < ApplicationRecord
  has_many :misses
  belongs_to :year
end
