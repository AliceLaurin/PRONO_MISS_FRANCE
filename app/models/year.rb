class Year < ApplicationRecord
  has_many :misses
  has_one :real_winner
  has_one :real_top_12
  has_one :real_top_5
  has_many :groups
  has_many :scores
  has_many :users, through: :scores
end
