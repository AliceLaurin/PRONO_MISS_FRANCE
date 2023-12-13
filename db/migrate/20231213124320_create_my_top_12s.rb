class CreateMyTop12s < ActiveRecord::Migration[7.1]
  def change
    create_table :my_top_12s do |t|
      t.references :miss, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
