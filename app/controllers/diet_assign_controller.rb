class DietAssignController < ApplicationController
	before_action :authenticate_person!
	def show
		@coach = Coach.find(params[:coach_id])
		@usersRequestingDiets = UserRequest.where(
			'option = 2 and status = 0'
			)
	end
end
