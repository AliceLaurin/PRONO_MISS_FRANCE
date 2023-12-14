class RealWinner < ApplicationRecord
  has_many :misses
  belongs_to :year
end
