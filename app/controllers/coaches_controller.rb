class CoachesController < ApplicationController
	before_action :authenticate_person!
	def show
		@coach = Coach.find(params[:id])
		@users = User.all
	end

	def users_profile
		@coach = Coach.find(params[:id])
		@user_profile = User.find(params[:id_user])
		@newest_info = UserMeasure.where(
			'user_id = :id',
			:id => @user_profile.id
			).order("created_at").last
		@newest_date = @newest_info.created_at.strftime('%d/%m/%y %H:%M')
	end
end
