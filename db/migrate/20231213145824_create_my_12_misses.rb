class CreateMy12Misses < ActiveRecord::Migration[7.1]
  def change
    create_table :my_12_misses do |t|
      t.references :my_top_12, null: false, foreign_key: true
      t.references :miss, null: false, foreign_key: true

      t.timestamps
    end
  end
end
