module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_person

    def connect
      self.current_person = find_verified_person
    end

    protected

    def find_verified_person
      if (current_person = env['warden'].person)
        current_perosn
      else
        reject_unauthorized_connection
      end
    end
  end
end
