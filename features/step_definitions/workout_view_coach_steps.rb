And(/^I have at least valid workout$/) do
	@workouts_history =  Workout.where(coach_id: @current_coach.id).includes(:workout_composes,
		 :user_do_workouts)
	@workout = FactoryGirl.create(:workout, coach_id: @current_coach.id)
	FactoryGirl.create(:user_do_workout, workout_id: @workout.id)
	FactoryGirl.create(:workout_compose, workout_id: @workout.id)
	Workout.joins(:user_do_workouts).count.should >= 1
	#puts "user id: #{@workouts_history[0].name}"

end

When(/^I acess my workout history$/) do
	visit coach_workouts_history_path(coach_id: @current_coach.id) 
end

Then(/^I should be able to see at least one workout I made$/) do
	#puts page.body
	page.should have_content(@workouts_history[0].name)
end