class RemoveRealToMiss < ActiveRecord::Migration[7.1]
  def change
    remove_reference :misses, :real_top_12
    remove_reference :misses, :real_top_5
  end
end
