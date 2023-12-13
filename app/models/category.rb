class Category < ApplicationRecord
  CATEGORIES = ["bombe", "mignonne", "pas ouf", "deg"]
  belongs_to :miss
  belongs_to :user
  validates :type, inclusion: { in:  CATEGORIES}
end
