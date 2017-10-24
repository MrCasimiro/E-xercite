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

When(/^Eu clicar no link da pagina avatar$/) do
	visit ('/gami')
end

Then (/^Eu devo ser direcionado para a pagina sobre avatar$/) do
	page.has_content?("pontos")
end

When(/^Eu clicar no link da pagina sobre nos$/) do
	visit ('/about')
end

Then (/^Eu devo ser direcionado para a pagina sobre nos$/) do
	page.has_content?("sobre nós")
end

When(/^Eu clicar no link da pagina contato$/) do
	visit ('/contact')
end

Then (/^Eu devo ser direcionado para a pagina contato$/) do
	page.has_content?("Envie sua mensagem à equipe")
end

When(/^Eu clicar no link da pagina entrar$/) do
	visit ('/login')
end

Then (/^Eu devo ser direcionado para a pagina entrar$/) do
	page.has_content?("Log in")
end

When(/^Eu clicar no link da pagina signup$/) do
	visit ('/signup')
end

Then (/^Eu devo ser direcionado para a pagina signup$/) do
	page.has_content?("Inscreva-se")
end