require 'date'

class UserMeasuresController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@user_measure= UserMeasure.new
	end

	def create
		@user_measure= UserMeasure.new(user_measure_params)
		if @user_measure.save
		end
	end

	def user_measure_params
		params.require(:user_measure).permit(:weight, :height, :neck, :leftbiceps, :rightbiceps, :chest, :waist, :hips, :leftthigh, :rightthigh, :leftcalve, :rightcalve,:user_id)
	end

	def show
		@user = User.find(params[:id])
		@newest_info = UserMeasure.where(
			'user_id = :id',
			:id => @user.id
			).order("created_at").last
		@newest_date = @newest_info.created_at.strftime('%d/%m/%y %H:%M')
	end
end
