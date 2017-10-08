class UserEatDietsController < ApplicationController
	def new
		@user_eat_diet = User_eat_diet.new
	end

	def create
		@user_eat_diet = User_eat_diet.new(user_eat_diet_params)
		if @user_eat_diet.save
			flash[:success] = "Comida adiconada com sucesso"
		end
  	end

  	def user_eat_diet_params
      params.require(:diet_compose).permit(:quantity, :hour, :day, :food_id, :diet_id)
    end
end

