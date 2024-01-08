class Droprealwinner < ActiveRecord::Migration[7.1]
  def change
    drop_table :real_winners

  end
end
