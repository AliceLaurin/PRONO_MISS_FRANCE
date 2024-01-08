class AddRealToMiss < ActiveRecord::Migration[7.1]
  def change
    add_reference :realfifteens, :miss, foreign_key: true
    add_reference :realfives, :miss, foreign_key: true
  end
end
