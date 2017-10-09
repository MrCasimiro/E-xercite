class CoachesController < ApplicationController
	def show
		@coach = Coach.find(params[:id])
		@users = User.all
	end

	def index
		@coach = Coach.find(current_person.id)
		redirect_to @coach
	end
	
end
