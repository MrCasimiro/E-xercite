class CreateUserDoWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_do_workouts do |t|

      t.belongs_to :user, unique: true, foreign_key:true
      t.belongs_to :workout, unique: true, foreign_key:true
      t.boolean :ended, :default => false
      t.integer :score
      t.timestamps
    end
    add_index :user_do_workouts, [:user_id, :workout_id], unique: true
  end
end
