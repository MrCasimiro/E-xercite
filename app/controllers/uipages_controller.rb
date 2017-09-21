class UipagesController < ApplicationController
  def user_ui
  end

  def employee_ui
  	@users = User.all
  end

end
