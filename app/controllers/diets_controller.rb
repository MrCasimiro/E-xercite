class DietsController < ApplicationController
	before_action :authenticate_person!
	def show
		@coach = Coach.find(params[:coach_id])
		@diet = Diet.new
		@diet.diet_composes.build
		@foods = Food.all
	end

	def create
		@diet = Diet.new(diet_params)
		@coach = Coach.find(params[:coach_id])
		if @diet.save
			flash.now[:success] = "success"
		end
	end

	private
	def diet_params
		# add attributes of nested association to whitelist
		params.require(:diet).permit(:name, :coach_id,
		 :diet_composes_attributes => [:quantity, :hour, :day, :food_id, :diet_id])    
	end

end
