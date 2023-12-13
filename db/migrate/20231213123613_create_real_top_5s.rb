class CreateRealTop5s < ActiveRecord::Migration[7.1]
  def change
    create_table :real_top_5s do |t|
      t.references :miss, null: false, foreign_key: true

      t.timestamps
    end
  end
end
