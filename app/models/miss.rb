class Miss < ApplicationRecord
  belongs_to :year
  belongs_to :real_top_12, optional: true
  belongs_to :real_top_5, optional: true
  belongs_to :real_winner, optional: true

  has_many :users
  has_many :categories, through: :users

  has_many :my_12_misses
  has_many :my_top_12s, through: :my_12_misses

  has_many :my_5_misses
  has_many :my_top_5s, through: :my_5_misses

  has_many :my_winners_misses
  has_many :my_winners, through: :my_winners_misses

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :region, presence:true
  validates :age, presence:true
  validates :year_id, presence:true
end
