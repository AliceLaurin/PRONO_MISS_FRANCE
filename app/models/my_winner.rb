class MyWinner < ApplicationRecord
  belongs_to :miss
  belongs_to :user
end
