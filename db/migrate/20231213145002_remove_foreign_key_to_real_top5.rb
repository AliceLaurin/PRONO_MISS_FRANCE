class RemoveForeignKeyToRealTop5 < ActiveRecord::Migration[7.1]
  def change
    remove_reference :real_top_5s, :miss
  end
end
