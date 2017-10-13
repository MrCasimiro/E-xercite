class Workout < ApplicationRecord
	belongs_to :coach

	has_many :user_do_workouts
	has_many :user, through: :user_do_workouts
	accepts_nested_attributes_for :user_do_workouts
	
	has_many :workout_composes
	has_many :exercises, through: :workout_composes
	accepts_nested_attributes_for :workout_composes
	
	validates :coach_id, presence: true
	validates :name, presence: true, length: {maximum: 50}
end
