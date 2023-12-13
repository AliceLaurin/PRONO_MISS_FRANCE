class CreateMyWinnersMisses < ActiveRecord::Migration[7.1]
  def change
    create_table :my_winners_misses do |t|
      t.references :my_winner, null: false, foreign_key: true
      t.references :miss, null: false, foreign_key: true

      t.timestamps
    end
  end
end
