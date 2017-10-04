class CreateWorkoutComposes < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_composes do |t|
      t.integer :set
      t.integer :repetition
      t.string :technique
      t.belongs_to :exercise, unique: true, foreign_key: true
      t.belongs_to :workout, unique: true, foreign_key: true

      t.timestamps
    end
    add_index :workout_composes, [:workout_id, :exercise_id], unique: true
  end
end
