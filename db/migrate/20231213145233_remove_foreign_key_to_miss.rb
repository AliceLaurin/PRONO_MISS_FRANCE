class RemoveForeignKeyToMiss < ActiveRecord::Migration[7.1]
  def change
    remove_reference :misses, :real_top_12
  end
end
