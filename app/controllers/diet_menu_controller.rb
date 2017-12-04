class DietMenuController < ApplicationController
	before_action :authenticate_person!
	def show
		@user = User.find(params[:id])
		@active_diet_search = UserEatDiet.where(
			'user_id = :id and finished = 0 and exp_date >= :today',
			:id => @user.id,
			:today => Time.now
			)

		@active_diet = @active_diet_search[0]

		if @active_diet != nil then
			@food_list = DietCompose.where('diet_id = :id',
			:id => @active_diet.diet_id)
		end


		@old_diets = UserEatDiet.where(
			'user_id = :id and (finished <> 0 or exp_date < :today)',
			:id => @user.id,
			:today => Time.now
			)
	end
end