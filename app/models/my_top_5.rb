class MyTop5 < ApplicationRecord
  belongs_to :user

  has_many :my_5_misses
  has_many :misses, through: :my_5_misses
end
