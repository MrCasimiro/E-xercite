class Workout < ApplicationRecord
	belongs_to :coach

	has_many :user_do_workouts
	has_many :user, through: :user_do_workouts

	has_many :workout_composes
	has_many :exercises, through: :workout_composes
end
