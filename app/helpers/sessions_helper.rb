module SessionsHelper
    include PeopleHelper	
	
    def current_user
	@current_user ||= User.find_by(person_id: current_person.id)
    end

    def current_coach
	@current_coach ||= Coach.find_by(person_id: current_person.id)
    end
end
