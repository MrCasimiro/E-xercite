class StatisticController < ApplicationController
	
	def show
	    @user = User.find(params[:id])
		@active_workout_search = UserDoWorkout.where(
				:id => @user.id
				)

			@active_workout = @active_workout_search[0]

			if @active_workout != nil then
				@exercise_list = WorkoutCompose.where('workout_id = :id',
				:id => @active_workout.workout_id)
			end
	end


	

end
