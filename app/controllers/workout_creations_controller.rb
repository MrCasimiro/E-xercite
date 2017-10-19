class WorkoutCreationsController < ApplicationController
	@user_do_workout_id
	def show
		@coach = Coach.find(params[:id])
		@user_workout = User.find(params[:id_user])
		#debugger
		@user_do_workout_id = @user_workout.id
	end	
	
	def create_do_workout
		@do_workout = UserDoWorkout.new(user_id: @user_do_workout_id, workout_id: params[:id_workout])
		#debugger

  	if @do_workout.save
  		flash[:success] = "Treino enviado com sucesso!"
      
  	else
  		render 'show'
  	end
	end


end
