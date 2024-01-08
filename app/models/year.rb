class Year < ApplicationRecord
  has_many :misses
  has_many :groups
  has_many :scores
  has_many :users, through: :scores
end
