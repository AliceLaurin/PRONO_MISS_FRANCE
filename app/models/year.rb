class Year < ApplicationRecord
  has_many :misses
  has_many :users, through: :groups
end
