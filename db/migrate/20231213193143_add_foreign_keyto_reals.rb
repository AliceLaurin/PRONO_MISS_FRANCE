class AddForeignKeytoReals < ActiveRecord::Migration[7.1]
  def change
    add_reference :real_top_12s, :year, foreign_key: true
  end
end
