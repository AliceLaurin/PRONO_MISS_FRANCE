class CreateYears < ActiveRecord::Migration[7.1]
  def change
    create_table :years do |t|
      t.integer :year
      t.date :date
      t.string :winner

      t.timestamps
    end
  end
end
