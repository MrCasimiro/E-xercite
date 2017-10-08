class DietsController < ApplicationController
	def new
		@diet = Diet.new
		@diet.diet_composes.build
	end

	def create
		@diet = Diet.new(diet_params)
		if @diet.save
			flash[:success] = "success"
		end
  	end


  	def diet_params
  		# add attributes of nested association to whitelist
  		params.require(:diet).permit(:name, :coach_id, :diet_composes_attributes => [:quantity, :hour, :day, :food_id, :diet_id])    
  	end

end
