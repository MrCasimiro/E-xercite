class AddEndedToUserDoWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :user_do_workouts, :ended, :boolean
  end
end
