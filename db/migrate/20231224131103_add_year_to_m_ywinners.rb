class AddYearToMYwinners < ActiveRecord::Migration[7.1]
  def change
    add_reference :my_winners, :year, foreign_key: true
  end
end
