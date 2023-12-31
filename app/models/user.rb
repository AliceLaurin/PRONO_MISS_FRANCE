class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :myfifteens
  has_many :mycinqs
  has_many :mywinners

  has_many :misses, through: :categories
  has_many :scores
  has_many :years, through: :scores
  has_many :group_users
  has_many :groups, through: :group_users

  validates :pseudo, presence:true

end
