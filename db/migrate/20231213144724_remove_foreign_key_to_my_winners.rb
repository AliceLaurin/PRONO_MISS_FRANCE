class RemoveForeignKeyToMyWinners < ActiveRecord::Migration[7.1]
  def change
    remove_reference :my_winners, :miss
  end
end
