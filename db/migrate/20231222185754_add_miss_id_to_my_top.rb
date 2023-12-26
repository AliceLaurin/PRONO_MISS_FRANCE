class AddMissIdToMyTop < ActiveRecord::Migration[7.1]
  def change
    add_reference :my_top_12s, :miss_id
    add_reference :my_top_5s, :miss_id
    add_reference :my_winners, :miss_id
  end
end
