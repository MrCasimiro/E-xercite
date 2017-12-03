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
	visit ("/sign_in")
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
	visit(coach_workouts_page_path(coach_id: @current_coach.id, id_user: @user.id))
end

When(/^I send the workout to user$/) do
	click_link('Enviar')
end


Then(/^the number of user's do workout should be increased by (\d+)$/) do |increase|
	puts(UserDoWorkout.where(user_id: @user.id).count)
	puts(@user.workouts.count)
	UserDoWorkout.where(user_id: @user.id).count.should == @value + 1
end

When(/^the user finishes the workout$/) do
	@user_do = UserDoWorkout.find_by(user_id: @user.id)
	@user_do.update_attributes(:ended => true)
	@user_do.save
	@current_score = @user_do.score
end

Then(/^I should be able to score the user$/) do
	@selected_score = 5
end

When(/^I submit the score$/) do
	@user_do.update_attributes(:score => @selected_score)
	@user_do.save
end

Then(/^the user's score should be different$/) do
	UserDoWorkout.find_by(user_id: @user.id).score.should_not == @current_score
end