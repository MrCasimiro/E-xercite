require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  describe "GET #show" do
     it "expect a new exercise" do
      get :show
       expect(assigns(:exercise)).to be_a_new(Exercise)
    end
  end

end
