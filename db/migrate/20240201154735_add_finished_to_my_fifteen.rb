class AddFinishedToMyFifteen < ActiveRecord::Migration[7.1]
  def change
    add_column :myfifteens, :completed, :boolean
  end
end
