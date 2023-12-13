class RemoveForeignKeyToRealWinners < ActiveRecord::Migration[7.1]
  def change
    remove_reference :real_winners, :miss

  end
end
