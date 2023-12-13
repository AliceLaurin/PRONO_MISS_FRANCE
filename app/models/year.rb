class Year < ApplicationRecord
  has_many :misses
  has_many :users, trough: :groups
end
