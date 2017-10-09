class FoodsController < ApplicationController
	def new
		@food = Food.new
		@allfood = Food.all
	end

	def create
		@food = Food.new(food_params)
		if @food.save
			flash[:success] = "Comida adiconada com sucesso"
		end
	end


	def food_params
		params.require(:food).permit(:name_food)
	end
end
