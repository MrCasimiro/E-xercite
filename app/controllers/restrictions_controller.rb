class RestrictionsController < ApplicationController
	def update
		@restriction = Restriction.find(params[:id])
		@user = User.find(params[:user_id])
		if @restriction.update_attributes(restriction_params)
	  		redirect_to profile_person_user_path(person_id: @user.person_id)
	  	end
	end

	def create
		@user = User.find(params[:user_id])
		@new_restriction = Restriction.new(restriction_params)
		if @new_restriction.save
			UserRestriction.create!(user_id: @user.id, restriction_id: @new_restriction.id)
			flash[:success] = "Comida adicionada com sucesso"
			redirect_to profile_person_user_path(person_id: current_person.id, id: @user.id)
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@user_restriction = UserRestriction.find_by(restriction_id: params[:id], user_id: @user.id)
		@user_restriction.destroy!
		redirect_to profile_person_user_path(person_id: current_person.id, id: @user.id)
	end

	private
	def restriction_params
		params.require(:restriction).permit(:name_restriction)
	end
end
