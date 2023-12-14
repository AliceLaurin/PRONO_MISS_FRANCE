class AddForeignKeyToMiss < ActiveRecord::Migration[7.1]
  def change
    add_reference :misses, :real_top_12, foreign_key: true
    add_reference :misses, :real_top_5, foreign_key: true
    add_reference :misses, :real_winner, foreign_key: true
  end
end
