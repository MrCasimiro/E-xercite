class FoodsController < ApplicationController


	def show
		@coach = Coach.find(params[:coach_id])
		@food = Food.new
		@allfood = Food.all
	end

	def create
		@coach = Coach.find(params[:coach_id])
		@food = Food.new(food_params)
		if @food.save
			flash[:success] = "Comida adicionada com sucesso"
		end
	end

	private

	def food_params
		params.require(:food).permit(:name_food)
	end
end
