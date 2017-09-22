class CreateCreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.belongs_to :coach, unique: true, foreign_key:true
      t.timestamps
    end
  end
end
