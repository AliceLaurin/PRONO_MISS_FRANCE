class AddStatusToYear < ActiveRecord::Migration[7.1]
  def change
    add_column :years, :status, :string
  end
end
