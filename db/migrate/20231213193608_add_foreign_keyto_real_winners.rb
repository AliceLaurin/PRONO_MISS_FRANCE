class AddForeignKeytoRealWinners < ActiveRecord::Migration[7.1]
  def change
    add_reference :real_winners, :year, foreign_key: true
  end
end
