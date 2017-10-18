When(/^Eu clicar no link da pagina$/) do
	visit ('/flexao')
end

Then (/^Eu devo ser direcionado para a pagina sobre flexao$/) do
	page.has_content?("flexao")
end