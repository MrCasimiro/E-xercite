Given(/^I have valid data registered$/) do
  @measure = FactoryGirl.create(:user_measure, user_id: @current_user.id)
end

When(/^I acess my user data page$/) do
  visit ("/users/#{@current_user.id}/user_measures/show/#{@current_user.id}")
end

Then(/^I should be able to see my data$/) do
	page.has_field?('user_data', :with => @measure.height)
	page.has_field?('user_data', :with => @measure.weight)
end

When(/^I acess the update data page$/) do
	click_link("button_new")
end

Then(/^I can update my data$/) do
	@registers_count = UserMeasure.count
	fill_in "user_measure_weight", :with => "70"
	fill_in "user_measure_height", :with => "1.70"
	click_button "submit_bt"
end

Then(/^the number of user measure register should be increased by (\d+)$/) do |arg1|
  UserMeasure.count.should == @registers_count+1
end

