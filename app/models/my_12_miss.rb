class My12Miss < ApplicationRecord
  self.table_name = "my_12_misses"

  belongs_to :my_top_12
  belongs_to :miss
end
