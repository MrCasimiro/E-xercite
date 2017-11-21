Given(/^that I'm a registered user to workout$/) do
	@person = FactoryGirl.create(:person)
	@current_user = User.create(person_id: @person.id)
end

Given(/^I'm signed in the system$/) do

	visit ("/sign_in")
	fill_in("email_field", :with => @person.email)
	fill_in("pass_field", :with => @person.password)
	click_button("submit_btn")
end

Given(/^I have one valid workout$/) do
	@person2 = FactoryGirl.create(:person)
	@current_coach = Coach.create(person_id: @person2.id)

	@workout = FactoryGirl.create(:workout, coach_id: @current_coach.id)

	user_do = UserDoWorkout.create(
		user_id: @current_user.id,
		workout_id: @workout.id,
		ended: false,
		score: 0
		)
end


When(/^I acess my workout page$/) do
  visit ("/users/"+@current_user.id.to_s+"/trainings/"+@current_user.id.to_s)
end

Then(/^I should be able to see only my workouts to be done$/) do
	page.has_field?('workout_name', :with => @workout.name)
end

When(/^I finish my workout$/) do
	@done_workout_count = UserDoWorkout.where(:user_id => @current_user.id).where(:workout_id => @workout.id).
		where(:ended => true).count
	click_button("terminar")
	@u = UserDoWorkout.where(:user_id => @current_user.id).where(:workout_id => @workout.id).first
	@u.ended = true
	@u.save
end

Then(/^the number of my finished workouts should be increased by (\d+)$/) do |arg|
	UserDoWorkout.where(:user_id => @current_user.id).where(:workout_id => @workout.id).where(:ended => true).count.
		should == @done_workout_count + 1
end

Then (/^I should be able to see my done workout in the done section$/) do
	page.has_field?('ended_workout_name', :with => @workout.name)
end