class AddDefaultFalueUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :users, :avatar, "profile/default.png"
  end
end
