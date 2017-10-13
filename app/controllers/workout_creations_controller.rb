class WorkoutCreationsController < ApplicationController

		def show
			@coach = Coach.find(params[:id])
		end	

		def create

		end

		def do_workout_params
			params.require(:diet_compose).permit(:quantity, :hour, :day, :food_id, :diet_id)
		end
end
