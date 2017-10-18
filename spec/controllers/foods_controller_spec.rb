require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe "GET #new" do
     it "expect a new workout" do
      get :new
       expect(assigns(:food)).to be_a_new(Food)
    end
  end

end
