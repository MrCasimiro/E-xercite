When(/^Eu clicar no link da pagina$/) do
	visit ('/flexao')
end

Then (/^Eu devo ser direcionado para a pagina sobre flexao$/) do
	page.has_content?("flexao")
end

When(/^Eu clicar no link da pagina squat$/) do
	visit ('/squat')
end

Then (/^Eu devo ser direcionado para a pagina sobre squat$/) do
	page.has_content?("squat")
end

When(/^Eu clicar no link da pagina burpee$/) do
	visit ('/burpee')
end

Then (/^Eu devo ser direcionado para a pagina sobre burpee$/) do
	page.has_content?("burpee")
end