class ChangeUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    rename_column :users, :name, :first_name
  end
end
