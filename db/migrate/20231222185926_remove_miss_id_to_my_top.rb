class RemoveMissIdToMyTop < ActiveRecord::Migration[7.1]
  def change
    remove_reference :my_top_12s, :miss_id
    remove_reference :my_top_5s, :miss_id
    remove_reference :my_winners, :miss_id
  end
end
