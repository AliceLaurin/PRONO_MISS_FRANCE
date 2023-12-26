class ChangeTop12Name < ActiveRecord::Migration[7.1]
  def change
    rename_table :my_top_12s, :myfifteens
    rename_table :my_top_5s, :myfives
  end
end
