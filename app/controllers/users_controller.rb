class UsersController < ApplicationController
	def index
		@user = User.find(current_person.id)
		redirect_to @user
	end
end
