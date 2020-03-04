require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET#new" do
    it "should render users form" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST#create" do

    let(:invalid_params) { { user: {name: "ken", password: "notpassword"} } }
    let(:valid_params) { { user: {username: "kenting", password: "password" } } }

    context "passing valid params" do
      it "creates a user" do
        post :create, params: valid_params
        expect(User.last.username).to eq("kenting")
      end
    end

    context "passing invalid params" do
      before :each do 
        post :create, params: invalid_params
      end

      it "adds error to flash" do
        expect(flash.now[:errors]).to be_present
      end

      it "does not save user to db" do
        expect(User.all).to be_empty
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
        expect(response).to have_http_status(422)
      end
      
    end

  end
  
  describe "GET#show" do
    let!(:user) { create(:user) }
    
    it "should render user show" do
      get :show, params: {id: user.id}
      expect(response).to render_template(:show)
    end

  end

end

