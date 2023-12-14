class CreateMy5Misses < ActiveRecord::Migration[7.1]
  def change
    create_table :my_5_misses do |t|
      t.references :my_top_5, null: false, foreign_key: true
      t.references :miss, null: false, foreign_key: true

      t.timestamps
    end
  end
end
