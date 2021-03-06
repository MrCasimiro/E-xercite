class WorkoutsController < ApplicationController
	before_action :authenticate_person!
	def workouts_page
		@user_workout = User.find(params[:id_user])
		@user_do_workout_id = @user_workout.id
	end

	def workouts_history
		@workouts_history = Workout.where(coach_id: current_coach.id).includes(:workout_composes,
		 :user_do_workouts)

	end	
	
	def create_do_workout
		@user_workout = User.find(params[:id_user])
		@user_do_workout_id = @user_workout.id
		@do_workout = UserDoWorkout.new(user_id: @user_do_workout_id,
		 workout_id: params[:workout_id], ended: false, score: 0)
		#debugger

		if @do_workout.save
			flash.now[:success] = "Treino enviado com sucesso!"
			#redirect_to coach_workout_creation_path
		else
			flash.now[:danger] = "Não foi possível adicionar o treino"
		end

		render 'workouts_page'
	end

	def workout_score
		@userDo = UserDoWorkout.find_by(user_id: params[:id_user], workout_id: params[:workout_id])
		@user_wkt = User.find(params[:id_user])
		if params[:save]
			current_score = @userDo.score
			new_score = params[:score]
			@userDo.update_attributes(:score => new_score)
			@user_wkt.update_attributes(:points => current_score.to_i + new_score.to_i)
			if (@userDo.save && @user_wkt.save)
				flash[:success] = "Nota enviada com sucesso!"
			end
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
