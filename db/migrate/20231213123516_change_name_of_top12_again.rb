class ChangeNameOfTop12Again < ActiveRecord::Migration[7.1]
  def change
    rename_table :real_top_12, :real_top_12s

  end
end
