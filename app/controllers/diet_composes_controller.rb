class DietComposesController < ApplicationController
	def new
		@diet_compose = DietCompose.new
	end

	def create
		@diet_compose = DietCompose.new(diet_compose_params)
		if @diet_compose.save
			flash[:success] = "Comida adiconada com sucesso"
		end
	end

	def diet_compose_params
		params.require(:diet_compose).permit(:quantity, :hour, :day, :food_id, :diet_id)
	end
end
