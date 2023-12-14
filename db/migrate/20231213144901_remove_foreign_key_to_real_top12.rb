class RemoveForeignKeyToRealTop12 < ActiveRecord::Migration[7.1]
  def change
    remove_reference :real_top_12s, :miss
  end
end
