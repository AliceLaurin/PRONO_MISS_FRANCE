class MyTop12 < ApplicationRecord
  self.table_name = "my_top_12s"

  belongs_to :user

  has_many :my_12_misses
  has_many :misses, through: :my_12_misses
end
