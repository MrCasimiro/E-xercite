Then(/^the user that made the request have a valid data$/) do
  @measure = FactoryGirl.create(:user_measure, user_id: @user.id)
end

When(/^I acess the user data page$/) do
	visit users_profile_person_coach_path(id: @current_coach.id, id_user: @current_request.user_id, person_id: @current_request.user_id)
end

Then(/^I should be able to see the users data$/) do
  page.has_field?('user_data', :with => @measure.height)
  page.has_field?('user_data', :with => @measure.weight)
end
