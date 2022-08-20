class AddColorPreferencesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :color_preferences, :string
  end
end
