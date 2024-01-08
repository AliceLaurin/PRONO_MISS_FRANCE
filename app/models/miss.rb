class Miss < ApplicationRecord
  belongs_to :year

  has_many :users
  has_many :categories

  has_many :myfifteens
  has_many :mycinqs
  has_many :my_winners


  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :region, presence:true
  validates :age, presence:true
  validates :year_id, presence:true
end
