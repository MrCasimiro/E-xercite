class _ui_headerController < ApplicationController
	def get_name
		@person = Person.find(params[:id])
		@person_name = @person.name
	end
end