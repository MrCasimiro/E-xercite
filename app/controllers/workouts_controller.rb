class WorkoutsController < ApplicationController
	def new
		@workout = Workout.new
		@workout.workout_composes.build
	end

	def create
		@workout = Workout.new(workout_params)
		if @workout.save
			flash[:success] = "success"
		end
	end


	def workout_params
		# add attributes of nested association to whitelist
		params.require(:workout).permit(:name, :coach_id, :workout_composes_attributes => [:set, :repetition, :technique, :exercise_id, :workout_id])    
	end

end
