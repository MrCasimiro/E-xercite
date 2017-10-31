class WorkoutsController < ApplicationController
	

	def show
		@coach_id = Coach.find_by person_id: 3
		@workout = Workout.new
		@workout.workout_composes.build
		@exericse = Exercise.all
	end

	def create
		@workout = Workout.new(workout_params)
		if @workout.save
			flash[:success] = "success"
		end
	end


	def workout_params
		# add attributes of nested association to whitelist
		params.require(:workout).permit(:name, :coach_id, :workout_composes_attributes => [:repetition, :set, :technique, :exercise_id, :workout_id])    
	end

end
