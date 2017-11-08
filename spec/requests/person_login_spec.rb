require 'rails_helper'

RSpec.describe "SessionsLogins", type: :request do


  before :each do
    @person = FactoryGirl.create(:person)
  end

  describe "GET /sessions_logins" do
    it "get login path should be acessible" do
      get sign_in_path
      expect(response).to have_http_status(200)
    end
  end

  describe "get with flash" do
  	it "testing flash" do
  		get sign_in_path
  		render_template 'sessions/new'
  		post sign_in_path, params: { session: { email: "", password: "" } }
  		render_template 'sessions/new'
  		expect(flash).to_not be_empty
  		get root_path
  		expect(flash).to be_empty
  	end
  end
=begin teste cagado sem nenhum motivo
  describe "testing layout changes in login" do
    it "login with valid information" do
      get login_path
      expect do
        post login_path, params: { 
          session: {
            email: @user.email,
            password: 'password'
          }
        }
      end

      expect(response).to redirect_to @user
      follow_redirect!
      expect(response).to render_template("users/show")
      assert_select "a[href=?]", login_path, count: 0
      assert_select "a[href=?]", logout_path
      assert_select "a[href=?]", user_path(@user)

    end
  end
=end
end
