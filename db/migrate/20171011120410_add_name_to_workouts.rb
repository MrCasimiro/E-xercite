class AddNameToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :name, :text
  end
end
