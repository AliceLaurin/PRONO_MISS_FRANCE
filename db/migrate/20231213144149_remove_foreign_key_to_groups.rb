class RemoveForeignKeyToGroups < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :groups, :users
  end
end
