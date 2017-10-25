class WorkoutMenuController < ApplicationController
	def show
		@user = User.find(params[:id])
		@active_workout_search = UserDoWorkout.where(
			'user_id = :id and finished = 0 and exp_date >= :today',
			:id => @user.id,
			:today => Time.now
			)

		@active_workout = @active_workout_search[0]

		if @active_workout != nil then
			@exercise_list = WorkoutCompose.where('workout_id = :id',
			:id => @active_workout.workout_id)
		end


		@old_workouts = UserDoWorkout.where(
			'user_id = :id and (finished <> 0 or exp_date < :today)',
			:id => @user.id,
			:today => Time.now
			)
	end
end