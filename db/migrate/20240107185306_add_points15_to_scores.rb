class AddPoints15ToScores < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :points_15, :boolean
  end
end
