When(/^I click at the link for flexao$/) do
	visit ('/flexao')
end

Then (/^I should go to the page about flexao$/) do
	page.has_content?("flexao")
end

When(/^I click at the link for squat$/) do
	visit ('/squat')
end

Then (/^I should go to the page about squat$/) do
	page.has_content?("squat")
end

When(/^I click at the link for burpee$/) do
	visit ('/burpee')
end

Then (/^I should go to the page about burpee$/) do
	page.has_content?("burpee")
end

When(/^I click at the link for avatar$/) do
	visit ('/gami')
end

Then (/^I should go to the page about avatar$/) do
	page.has_content?("pontos")
end

When(/^I click at the link for sobre nos$/) do
	visit ('/about')
end

Then (/^I should go to the page about sobre nos$/) do
	page.has_content?("sobre nós")
end

When(/^I click at the link for contato$/) do
	visit ('/contact')
end

Then (/^I should go to the page about contato$/) do
	page.has_content?("Envie sua mensagem à equipe")
end

When(/^I click at the link for entrar$/) do
	visit ('/login')
end

Then (/^I should go to the page about entrar$/) do
	page.has_content?("Log in")
end

When(/^I click at the link for signup$/) do
	visit ('/signup')
end

Then (/^I should go to the page about signup$/) do
	page.has_content?("Inscreva-se")
end