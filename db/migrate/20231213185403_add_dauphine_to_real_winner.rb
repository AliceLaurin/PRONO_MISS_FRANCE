class AddDauphineToRealWinner < ActiveRecord::Migration[7.1]
  def change
    add_column :real_winners, :miss_france, :string
    add_column :real_winners, :first_dauphine, :string
    add_column :real_winners, :second_dauphine, :string
    add_column :real_winners, :third_dauphine, :string
    add_column :real_winners, :fourth_dauphine, :string
  end
end
