class TrainingsController < ApplicationController
	before_action :authenticate_person!
	def show
		@user = User.find(params[:id])
	end

	def end_workout
		u_id = params[:user_id_wo]
		w_id = params[:workout_id_wo]

		@finish_workout = UserDoWorkout.where(:user_id => u_id).where(:workout_id => w_id).first
		@finish_workout.update_attributes(:ended => true)
	
		if @finish_workout.save
			flash.now[:success] = "Treino terminado com sucesso!"
		end
	end
end
