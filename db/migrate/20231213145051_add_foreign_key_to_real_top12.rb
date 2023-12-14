class AddForeignKeyToRealTop12 < ActiveRecord::Migration[7.1]
  def change
    add_reference :misses, :real_top_12
  end
end
