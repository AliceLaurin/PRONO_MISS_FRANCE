class RemoveForeignKeyToMy12 < ActiveRecord::Migration[7.1]
  def change
    remove_reference :my_top_12s, :miss
  end
end
