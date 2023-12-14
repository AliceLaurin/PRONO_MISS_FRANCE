class AddPointToScore < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :points, :integer, default: 0
  end
end
