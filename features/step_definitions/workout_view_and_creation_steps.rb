Given(/^I am a registered coach$/) do
	@person = FactoryGirl.create(:person)
	@current_coach = Coach.create(person_id: @person.id)
end

Given(/^a specific user$/) do
	@user = FactoryGirl.create(:user, id: 3)
	puts(@user.workouts.count)
	@value = @user.workouts.count
end

Given(/^there is a workout that isn't already sent to user$/) do
	@workout = FactoryGirl.create(:workout, coach_id: @current_coach.id)
	@workout_compose = FactoryGirl.create(:workout_compose, workout_id: @workout.id)
end

Given(/^I am log in$/) do
	visit ("/login")
	fill_in("email_field", :with => @person.email)
	fill_in("pass_field", :with => @person.password)
	click_button("submit_btn")
end

Given(/^I am on the coach's root path$/) do
	visit (person_coach_path(person_id: @person.id, coach_id: @current_coach.id, id: @current_coach.id))
end


When(/^I go to the link in \"Montar Treino\" for this specific user$/) do
	click_button("training")
end


Then(/^I should be on user's workout page$/) do
	visit(coach_workout_path(coach_id: @current_coach.id, id: @current_coach.id, id_user: @user.id))
end

When(/^I send the workout to user$/) do
	click_link('Enviar')
end


Then(/^the number of user's do workout should be increased by (\d+)$/) do |increase|
	puts(UserDoWorkout.where(user_id: @user.id).count)
	puts(@user.workouts.count)
	UserDoWorkout.where(user_id: @user.id).count.should == @value + 1
end

