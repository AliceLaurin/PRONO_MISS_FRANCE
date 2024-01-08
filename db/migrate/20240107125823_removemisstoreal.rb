class Removemisstoreal < ActiveRecord::Migration[7.1]
  def change
    remove_reference :realfifteens, :miss
    remove_reference :realfives, :miss
  end
end
