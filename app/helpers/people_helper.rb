module PeopleHelper
    def current_person
       @current_person ||= Person.find_by(person_id: @current_person.id) 
    end
end
