class WorkoutsController < ApplicationController
	def show
		@coach = Coach.find(params[:id])
		@user_workout = User.find(params[:id_user])
		@user_do_workout_id = @user_workout.id
	end	
	
	def create_do_workout
		@coach = Coach.find(params[:coach_id])
		@user_workout = User.find(params[:id_user])
		@user_do_workout_id = @user_workout.id
		@do_workout = UserDoWorkout.new(user_id: @user_do_workout_id, workout_id: params[:workout_id])
		#debugger

		if @do_workout.save
			flash[:success] = "Treino enviado com sucesso!"
			#redirect_to coach_workout_creation_path
		else
			render 'show'
		end
	end

	def new
		@workout = Workout.new
		@coach = Coach.find(params[:coach_id])
	end

	def create
		@workout = Workout.new(workout_params)
		@coach = Coach.find(params[:coach_id])
		if @workout.save
			redirect_to coach_workouts_path
		else
			render 'new'
		end
	end

	private
	def workout_params
		params.require(:workout).permit(:name, :coach_id,
		 :workout_composes_attributes => [:set, :repetition, :technique, :exercise_id, :workout_id])
	end
end
