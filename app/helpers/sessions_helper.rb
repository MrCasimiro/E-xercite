module SessionsHelper

	def log_in(person)
		session[:person_id] = person.id
	end

	def current_person
		# X ||=Y => X = X || Y
		@current_person ||= Person.find_by(id: session[:person_id])
	end

	def current_user
		@current_user ||= User.find_by(person_id: @current_person.id)
	end

	def logged_in?
		!current_person.nil?
	end

	def log_out
		session.delete(:person_id)
		@current_person = nil
	end
end
