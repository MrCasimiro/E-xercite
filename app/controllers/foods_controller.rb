class FoodsController < ApplicationController
	before_action :authenticate_person!

	def show
		@coach = Coach.find(params[:coach_id])
		@food = Food.new
		@allfood = Food.all
	end

	def create
		@new_food = Food.new(food_params)
		if @new_food.save
			flash[:success] = "Comida adicionada com sucesso"
		end
	end

	private

	def food_params
		params.require(:food).permit(:name_food)
	end
end
