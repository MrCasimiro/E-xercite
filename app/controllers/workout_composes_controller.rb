class WorkoutComposesController < ApplicationController
	def new
		@workout_compose = workoutCompose.new
	end

	def create
		@workout_compose = WorkoutCompose.new(workout_compose_params)
		if @workout_compose.save
			flash[:success] = "Exercício criado com sucesso"
		end
	end

	def workout_compose_params
		params.require(:workout_compose).permit(:set, :repetition, :technique, :exercise_id, :workout_id)
	end
end
