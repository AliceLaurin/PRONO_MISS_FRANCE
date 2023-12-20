class MyTop12 < ApplicationRecord
  belongs_to :user

  has_many :my_12_misses
  has_many :misses, through: :my_12_misses
end
