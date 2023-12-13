class CreateRealWinners < ActiveRecord::Migration[7.1]
  def change
    create_table :real_winners do |t|
      t.references :miss, null: false, foreign_key: true

      t.timestamps
    end
  end
end
