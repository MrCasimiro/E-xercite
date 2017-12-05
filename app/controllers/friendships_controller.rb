class FriendshipsController < ApplicationController
	before_action :authenticate_person!
	include SessionsHelper

	def new 
	end

	def create
		@friendship = current_user.friendships.build(friend_id: params[:friend_id])
		if @friendship.save
			flash.now[:success] = "Requisição de amizade enviada"
		end
		render :new
	end

	def update
		@friendship = Friendship.find_by(id: params[:id])
		@friendship.update_attribute(:accepted, "accepted")
		if @friendship.save
			flash.now[:success] = "Amizade confirmada!"
		end
		render :new
	end

	def destroy
		@friendship = Friendship.find_by(id: params[:id])
		@friendship.destroy
		redirect_to person_user_path(id: current_user.id, person_id: current_user.person_id)
	end
end
