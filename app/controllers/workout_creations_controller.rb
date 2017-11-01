class WorkoutCreationsController < ApplicationController
	def show
		@coach = Coach.find(params[:id])
		@user_workout = User.find(params[:id_user])
		@user_do_workout_id = @user_workout.id
	end	
	
	def create_do_workout
		@coach = Coach.find(params[:coach_id])
		@do_workout = UserDoWorkout.new(user_id: @user_do_workout_id, workout_id: params[:id_workout])
		#debugger

		if @do_workout.save
			flash[:success] = "Treino enviado com sucesso!"
			#redirect_to coach_workout_creation_path
		else
			render 'show'
		end
	end

end
