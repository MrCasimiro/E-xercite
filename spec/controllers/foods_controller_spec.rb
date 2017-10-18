require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
describe 'GET #new' do
  it 'assigns a new food to @food' do
    get :new
expect(assigns(:food))to be_a_new(Food)
  end
end
