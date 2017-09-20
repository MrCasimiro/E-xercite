class UipagesController < ApplicationController
  def user_ui
  end

  def employee_ui
  end

  def index
  	@users = User.all
  	#u = User.new(name: 'teste', email: 'teste@teste.com', age: 0, phone: '0', gender: 'X', lesionHistory: 'none', diseases: 'none', restrictions: 'none', coach: 't', password_digest>: '0'

  end
end
