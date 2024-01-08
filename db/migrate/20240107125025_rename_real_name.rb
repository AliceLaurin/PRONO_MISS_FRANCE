class RenameRealName < ActiveRecord::Migration[7.1]
  def change
    rename_table :real_top_12s, :realfifteens
    rename_table :real_top_5s, :realfives
  end
end
