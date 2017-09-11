class ChangeCoachDefault < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :coach, :boolean, :default => false
  end
end
