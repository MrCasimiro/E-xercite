class DietAssignController < ApplicationController
	def show
		@usersRequestingDiets = UserRequest.where(
			'option = 2 and status = 0'
			)
	end
end
