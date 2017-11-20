class TrainingsController < ApplicationController
	def show
		@user = User.find(params[:id])
		
	end

	def end_workout
		@finish_workout = UserDoWorkout.find(params[:user_id_wo], params[:workout_id_wo])
		@finish_workout.update_attributes(ended: true)

		if @finish_workout.save
			flash[:success] = "Treino terminado com sucesso!"
			render 'show'
		end
	end
end
