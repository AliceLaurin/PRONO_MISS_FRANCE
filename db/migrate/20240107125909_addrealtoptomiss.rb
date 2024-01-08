class Addrealtoptomiss < ActiveRecord::Migration[7.1]
  def change
    add_reference :misses, :realfifteen, foreign_key: true
    add_reference :misses, :realfife, foreign_key: true
  end
end
