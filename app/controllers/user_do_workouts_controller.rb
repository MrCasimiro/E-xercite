class UserDoWorkoutsController < ApplicationController
	def new
		@user_do_workout = User_do_workout.new
	end

	def create
		@user_do_workout = User_do_workout.new(user_do_workout_params)
		if @user_do_workout.save
			flash[:success] = "Treino adicionado com sucesso"
		end
	end

	def user_do_workout_params
		params.require(:workout_compose).permit(:repetition, :set, :technique, :exercise_id, :workout_id)
	end
end

