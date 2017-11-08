require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe "GET #show" do
     it "expect a new workout" do
      get :show
       expect(assigns(:food)).to be_a_new(Food)
    end
  end

end
