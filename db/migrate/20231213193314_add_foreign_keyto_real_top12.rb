class AddForeignKeytoRealTop12 < ActiveRecord::Migration[7.1]
  def change
    add_reference :real_top_5s, :year, foreign_key: true
  end
end
