class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :new_users, :users
  end
end
