require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
  it "expect a new workout" do
      get :show
       expect(assigns(:workout)).to be_a_new(Workout)
    end
end
