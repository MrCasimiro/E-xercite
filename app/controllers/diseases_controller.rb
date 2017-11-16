class DiseasesController < ApplicationController
	def update
		@disease = Disease.find(params[:id])
		@user = User.find(params[:user_id])
		if @disease.update_attributes(disease_params)
	  		redirect_to profile_person_user_path(person_id: @user.person_id)
	  	else
	  		render 'users#setting'
	  	end
	end

	private
	def disease_params
		params.require(:disease).permit(:name_disease)
	end
end
