class RemoveForeignKeyToMy5 < ActiveRecord::Migration[7.1]
  def change
    remove_reference :my_top_5s, :miss
  end
end
