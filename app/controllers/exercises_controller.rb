class ExercisesController < ApplicationController


	def show
		@exercise = Exercise.new
		@allexercise = Exercise.all
	end

	def create
		@exercise = Exercise.new
		@exercise = Exercise.new(exercise_params)
		if @exercise.save
			flash[:success] = "Exercício adicionado com sucesso"
		end
	end


	def exercise_params
		params.require(:exercise).permit(:name_exercise)
	end
end
