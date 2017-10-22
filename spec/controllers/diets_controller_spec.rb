require 'rails_helper'

RSpec.describe DietsController, type: :controller do
  it "expect a new diet" do
      get :new
       expect(assigns(:diet)).to be_a_new(Diet)
    end
end
