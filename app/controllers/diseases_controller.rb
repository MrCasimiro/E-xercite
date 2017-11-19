class DiseasesController < ApplicationController
	def update
		@disease = Disease.find(params[:id])
		@user = User.find(params[:user_id])
		if @disease.update_attributes(disease_params)
	  		redirect_to profile_person_user_path(person_id: @user.person_id)
	  	end
	end

	def create
		@user = User.find(params[:user_id])
		@new_disease = Disease.new(disease_params)
		if @new_disease.save
			UserDisease.create!(user_id: @user.id, disease_id: @new_disease.id)
			flash[:success] = "Comida adicionada com sucesso"
			redirect_to profile_person_user_path(person_id: current_person.id, id: @user.id)
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@user_disease = UserDisease.find_by(disease_id: params[:id], user_id: @user.id)
		@user_disease.destroy!
		redirect_to profile_person_user_path(person_id: current_person.id, id: @user.id)
	end

	private
	def disease_params
		params.require(:disease).permit(:name_disease)
	end
end
