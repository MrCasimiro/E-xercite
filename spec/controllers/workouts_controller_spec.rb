require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
  
  describe "GET #new" do
     it "expect a new workout" do
      get :new
       expect(assigns(:workout)).to be_a_new(Workout)
    end
  end

end
