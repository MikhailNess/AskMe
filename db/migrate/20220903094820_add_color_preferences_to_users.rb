class AddColorPreferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :color_preferences, :string, default: '#370617'
  end
end
