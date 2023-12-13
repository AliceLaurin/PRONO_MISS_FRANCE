class Miss < ApplicationRecord
  belongs_to :year
  has_many :categories
  has_one :real_top_12
  has_one :real_top_5
  has_one :real_winner
  has_many :my_top_12s
  has_many :my_top_5s
  has_many :my_winners
end
