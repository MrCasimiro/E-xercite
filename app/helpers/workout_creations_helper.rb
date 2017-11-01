module WorkoutCreationsHelper
	def user_do_workout?(user, workout)
		UserDoWorkout.find_by(user_id: user.id, workout_id: workout.id).nil?
	end
end
