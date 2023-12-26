class AddMissIdToMyTop2 < ActiveRecord::Migration[7.1]
  def change
    add_reference :my_top_12s, :miss, foreign_key: true
    add_reference :my_top_5s, :miss, foreign_key: true
    add_reference :my_winners, :miss, foreign_key: true
  end
end
