module WorkoutsHelper
	def user_do_workout?(user, workout)
		UserDoWorkout.find_by(user_id: user.id, workout_id: workout.id).nil?
	end

	def find_workouts(coach)
		@workout_composes = []
		Workout.where(coach_id: coach.id).each do |wo|
			@workout_composes << wo.workout_composes
		end 
	end
end
