class ChooseDietController < ApplicationController

	def show
		@requester_id = params[:requester_id]
		@assign = UserEatDiet.new
	end

	def create
		@assign = UserEatDiet.new(assign_params)
		if @assign.save
			flash[:success] = "success"
			update_request_status(assign_params)
		end
	end

	def update_request_status(params)
		UserRequest.where(
			'option = 2 and status = 0 and user_id = :requester_id',
			:requester_id => params[:user_id]
			).update_all(status: 1)
	end

	def assign_params
		# add attributes of nested association to whitelist
		params.require(:user_eat_diet).permit(:user_id, :diet_id, :finished, :exp_date)    
	end

end

