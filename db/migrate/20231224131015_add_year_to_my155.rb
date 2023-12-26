class AddYearToMy155 < ActiveRecord::Migration[7.1]
  def change
    add_reference :myfifteens, :year, foreign_key: true
    add_reference :myfives, :year, foreign_key: true
  end
end
