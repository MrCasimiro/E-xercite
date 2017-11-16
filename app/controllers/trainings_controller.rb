class TrainingsController < ApplicationController
	def show
		@user = User.find(params[:id])
		
	end

	def end_workout
		@finish_workout = UserDoWorkout.find(params[:user_id, :workout_id])
		@finish_workout.update_attributes(:ended)
	end
end
