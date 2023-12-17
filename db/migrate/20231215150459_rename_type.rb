class RenameType < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :type, :critere
  end
end
