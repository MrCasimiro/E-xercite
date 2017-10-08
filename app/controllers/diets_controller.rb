class DietsController < ApplicationController
	def new
		@diet = Diet.new
		@diet.diet_composes.build
	end

	def create
		@diet = Diet.new(diet_params)
		if @diet.save
			flash[:success] = "Comida adiconada com sucesso"
		end
  	end


  	def diet_params
      params.require(:diet).permit(:name, :coach_id)
    end

end
