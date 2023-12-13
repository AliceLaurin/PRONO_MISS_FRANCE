class ChangeNameOfTop12 < ActiveRecord::Migration[7.1]
  def change
    rename_table :real_top_12s, :real_top_12
  end
end
