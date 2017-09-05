require 'rails_helper'

RSpec.describe UipagesController, type: :controller do

  describe "GET #user_ui" do
    it "returns http success" do
      get :user_ui
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #employee_ui" do
    it "returns http success" do
      get :employee_ui
      expect(response).to have_http_status(:success)
    end
  end

end
