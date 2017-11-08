class CoachesController < ApplicationController
	before_action :authenticate_person!
	def show
		@coach = Coach.find(params[:id])
		@users = User.all
	end

	def users_profile
		@coach = Coach.find(params[:coach_id])
		@user_profile = User.find(params[:id_user])
	end
end
