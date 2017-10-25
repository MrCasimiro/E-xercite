class WorkoutCompose < ApplicationRecord
	belongs_to :workout
	belongs_to :exercise
	
	validates :exercise_id, :set, :repetition, :technique, presence: true
	validates :set, numericality: { greater_than: 0}
	validates :repetition, numericality: { greater_than: 0}
end
