class Group < ApplicationRecord
  belongs_to :year
  has_many :group_users
  has_many :users, through: :group_users
end
