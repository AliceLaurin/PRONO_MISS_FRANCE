class DropMy12Miss < ActiveRecord::Migration[7.1]
  def change
    drop_table :my_12_misses
    drop_table :my_5_misses
    drop_table :my_winners_misses
  end
end
