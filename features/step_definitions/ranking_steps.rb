When(/^I visit the global rank$/) do
	visit user_rankings_global_ranking_path(user_id: @current_user.id)
end

When(/^I visit the local rank$/) do
	visit user_rankings_local_ranking_path(user_id: @current_user.id)
end

Then(/^I want to see my rank$/) do
	page.should have_content("1º")
	page.should have_content(@current_user.person.name)
end
