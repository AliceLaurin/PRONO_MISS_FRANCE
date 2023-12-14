class AddColomnToMyRealTop12 < ActiveRecord::Migration[7.1]
  def change
    add_column :my_top_12s, :my_miss_france_guess, :string
  end
end
