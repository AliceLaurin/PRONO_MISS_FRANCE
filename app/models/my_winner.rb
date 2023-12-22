class MyWinner < ApplicationRecord
  belongs_to :user

  has_many :my_winners_misses
  has_many :misses, through: :my_winners_misses
end
