require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  before :each do 
    @person = FactoryGirl.create(:person)
    @user = FactoryGirl.create(:user, person_id: @person.id)
    @new_friend = FactoryGirl.create(:user)
    @requested = FactoryGirl.create(:user)
    @friendship = FactoryGirl.create(:friendship, 
      user_id: @user.id, friend_id: @requested.id)
    @accepted_friendship = FactoryGirl.create(:friendship, 
      user_id: @user.id, accepted: true)
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in @person
      get :new, params: {user_id: @user.id}
      expect(response).to render_template('friendships/new')
    end
  end

  describe "GET #create" do
    it "returns http success" do
      sign_in @person
      expect do
        post :create, params: {user_id: @user.id, friend_id: @new_friend.id}
      end.to change {Friendship.where(friend_id: @new_friend.id, 
        user_id: @user.id).count}

      expect(response).to render_template('friendships/new')
    end
  end

  describe "GET #update" do
    it "returns http success" do
      sign_in @person
      expect do
        put :update, params: {user_id: @user.id, 
          friend_id: @requested.id, id: @friendship.id}
      end.to change {Friendship.where(friend_id: @requested.id, 
        user_id: @user.id, accepted: true).count}

      expect(response).to render_template('friendships/new')
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      sign_in @person
      expect do
        delete :destroy, params: {id: @accepted_friendship.id, user_id: @user.id}
      end.to change {Friendship.all.count}
      expect(response).to redirect_to person_user_path(id: @user.id, person_id: @person.id)
    end
  end

end
