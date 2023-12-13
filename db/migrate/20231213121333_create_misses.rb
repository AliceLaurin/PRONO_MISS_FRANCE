class CreateMisses < ActiveRecord::Migration[7.1]
  def change
    create_table :misses do |t|
      t.string :first_name
      t.string :last_name
      t.string :region
      t.string :age
      t.string :height
      t.string :photo
      t.references :year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
