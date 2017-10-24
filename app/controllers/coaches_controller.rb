class CoachesController < ApplicationController
	def show
		@coach = Coach.find(params[:id])
		@users = User.all
	end
end
