class ExercisesController < ApplicationController
	def new
		@exercise = Exercise.new
	end

	def create
		@exercise = Exercise.new(exercise_params)

	end

	private
	def exercise_params
		params.require(:exercise).permit(:name_exercise)
	end
end
