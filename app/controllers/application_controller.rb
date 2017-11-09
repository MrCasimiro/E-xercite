class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

   def after_sign_in_path_for(person)
    if person.type == "User"
      user_authenticated_root_path
    elsif person.type == "Coach"
      coach_authenticated_root_path
    else 
      root_path
    end 
  end 
end
