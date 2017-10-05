class Exercise < ApplicationRecord
	has_many :workout_composes
	has_many :workouts, through: :workout_composes 
end
