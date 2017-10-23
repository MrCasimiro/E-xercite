class AddAvatarColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :character, :string, default: "characters/avatar1.png"
  end
end
