require 'rails_helper'

RSpec.describe "SessionsLogins", type: :request do
  describe "GET /sessions_logins" do
    it "get login path should be acessible" do
      get login_path
      expect(response).to have_http_status(200)
    end
  end

  describe "get with flash" do
  	it "testing flash" do
  		get login_path
  		render_template 'sessions/new'
  		post login_path, params: { session: { email: "", password: "" } }
  		render_template 'sessions/new'
  		expect(flash).to_not be_empty
  		get root_path
  		expect(flash).to be_empty
  	end
  end
end
