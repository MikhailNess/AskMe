class AddNicknameIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :nickname, :string
    add_column :users, :nickname, :string
    add_index :users, :nickname, unique: true
  end
end
