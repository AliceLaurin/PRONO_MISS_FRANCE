class Removeforeignkeytomiss < ActiveRecord::Migration[7.1]
  def change
    remove_reference :misses, :realfifteen
    remove_reference :misses, :realfife
    remove_reference :misses, :real_winner

  end
end
