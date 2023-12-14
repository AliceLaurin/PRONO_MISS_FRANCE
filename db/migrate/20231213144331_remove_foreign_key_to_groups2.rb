class RemoveForeignKeyToGroups2 < ActiveRecord::Migration[7.1]
  def change
    remove_reference :groups, :user
  end
end
