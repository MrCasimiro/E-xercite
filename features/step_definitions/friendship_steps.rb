Given(/^I have a user that is not my friend$/) do
	@person_not_friend = FactoryGirl.create(:person)
	@not_friend = FactoryGirl.create(:user, person_id: @person_not_friend.id)
end

When(/^I acess my friendships page$/) do
	click_link('Amizades')
end

Then(/^I should be able to see friends I don't have$/) do 
	page.should have_content(@not_friend.person.name)
end

When(/^I press to add a friend$/) do
	@friendships = Friendship.where(user_id: @current_user.id).count
	click_button("add-friend-#{@not_friend.id}")
	debugger
end

Then(/^my not accepted friendship's number should increase by (\d+)$/) do |increase|
	Friendship.where(user_id: @current_user.id).count.should == @friendships + increase.to_i
end

=begin it doesn't work for some reason
And(/^I have a friendship's request$/) do
	@person_request_friend = FactoryGirl.create(:person)
	@request_friend = FactoryGirl.create(:user, person_id: @person_request_friend.id)
	@request_friendship = FactoryGirl.create(:friendship, 
		friend_id: @current_user.id, user_id: @request_friend.id, id: 1)
end
=end

And(/^I have a accepted friendship$/) do
	@person_friend = FactoryGirl.create(:person)
	@friend = FactoryGirl.create(:user, person_id: @person_friend.id)
	@friendship = FactoryGirl.create(:friendship, 
		user_id: @current_user.id, friend_id: @friend.id)
end

Then(/^I should be able to see a friendship I have$/) do
	page.should have_content(@friend.person.name)
end
