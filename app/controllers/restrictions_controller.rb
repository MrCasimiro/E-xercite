class RestrictionsController < ApplicationController
	def update
		@restriction = Restriction.find(params[:id])
		@user = User.find(params[:user_id])
		if @restriction.update_attributes(restriction_params)
	  		redirect_to profile_person_user_path(person_id: @user.person_id)
	  	else
	  		render 'users#setting'
	  	end
	end

	private
	def restriction_params
		params.require(:restriction).permit(:name_restriction)
	end
end
