class ChangeNameOfMyFive < ActiveRecord::Migration[7.1]
  def change
    rename_table :myfives, :mycinqs
  end
end
