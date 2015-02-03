require 'rails_helper'

RSpec.describe HomevisitsController, :type => :controller do

  describe "GET #new" do
    it "assigns a new homevisit to @homevisit" do
      get :new
      expect(assigns(:homevisit)).to be_a_new(Homevisit)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe "GET #show" do
      before do
       @client = Client.create(id: 1, name: "travis", email: 'user@example.com')
      end
    it "assigns the requested homevisit to @homevisit" do
      homevisit = create(:homevisit, client_id: 1)
      get :show, id: homevisit, client_id: @client
      expect(homevisit.client_id).to eq 1
    end
    it "renders the :show template" do
      homevisit = create(:homevisit)
      get :show, id: homevisit,  client_id: @client
      expect(response).to render_template :show
    end
  end
  
  describe "GET #index" do
    it "populates an array of all the homevisits" do
      smith = create(:homevisit)
      jones = create(:homevisit)
      get :index
      expect(assigns(:homevisits)).to match_array([smith, jones])
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET #edit" do
    it "assigns the requested homevisit to @homevisit" do
      homevisit = create(:homevisit)
      get :edit, id: homevisit
      expect(assigns(:homevisit)).to eq homevisit
    end
    it "renders the :edit template" do
      homevisit = create(:homevisit)
      get :edit, id: homevisit
      expect(response).to render_template :edit
    end
  end
  
  describe "POST #create" do
      before do
       @client = Client.create(id: 1, name: "travis", email: 'user@example.com')
      end
    context "with valid attributes" do
      it "saves the new homevisit in the database" do
        expect{
          post :create, client_id: @client, homevisit: attributes_for(:homevisit)
        }.to change(Homevisit, :count).by(1)
      end
      it "redirects to the homevisits#show" do
        homevisit = create(:homevisit)
        get :show, client_id: @client, id: homevisit
        expect(response).to render_template :show
      end
      it "belongs to the correct client" do
        homevisit = create(:homevisit, client_id: 2)
        post :create, client_id: @client, homevisit: attributes_for(:homevisit) 
        expect(homevisit.client_id).to be 2
      end
    end
    context "with invalid attributes" do
      it "does not save the new homevisit in the database" do
        expect{
          post :create, client_id: @client, 
            homevisit: attributes_for(:invalid_homevisit)
          expect(response).to render_template :new
        }.not_to change(Homevisit, :count)
      end
      it "re-renders the :new template" do
        post :create, client_id: @client,
          homevisit: attributes_for(:invalid_homevisit)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @client = Client.create(id: 1, name: "travis", email: 'user@example.com')
      @homevisit = create(:homevisit, date_of_departure: '2014-1-1')
    end
    context "with valid attributes" do
      it "locates the requested @homevisit" do
        patch :update, id: @homevisit, client_id: @client, homevisit: attributes_for(:homevisit)
        expect(assigns(:homevisit)).to eq(@homevisit)
      end
      it "redirects to the contact" do
        patch :update, id: @homevisit, homevisit: attributes_for(:homevisit)
        expect(response).to redirect_to @homevisit        
      end
    end

    context "with invalid attributes" do
      it "does not change the contacts attributes" do
        patch :update, id: @homevisit,
          homevisit: attributes_for(:homevisit, date_of_departure: nil)
        @homevisit.reload
        expect(@homevisit.id).not_to eq '2014-1-1'
      end
      it "re-renders the :edit template" do
        patch :update, id: @homevisit,
          homevisit: attributes_for(:invalid_homevisit)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @homevisit = create(:homevisit)
    end
    it "deletes the contact from the database" do
      expect{
        delete :destroy, id: @homevisit
      }.to change(Homevisit, :count).by(-1)
    end
    it "redirects to users#index" do
      delete :destroy, id: @homevisit
      expect(response).to redirect_to :homevisits
    end
  end
end















