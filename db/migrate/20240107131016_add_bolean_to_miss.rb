class AddBoleanToMiss < ActiveRecord::Migration[7.1]
  def change
    add_column :misses, :fifteen, :boolean
    add_column :misses, :five, :boolean
    add_column :misses, :winner, :boolean
  end
end
