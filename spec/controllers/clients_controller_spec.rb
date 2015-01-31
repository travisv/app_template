require 'rails_helper'

RSpec.describe ClientsController, :type => :controller do

  describe "GET #new" do
    it "assigns a new client to @client" do
      get :new
      expect(assigns(:client)).to be_a_new(Client)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe "GET #show" do
    it "assigns the requested client to @client" do
      client = create(:client)
      get :show, id: client
      expect(assigns(:client)).to eq client
    end
    it "renders the :show template" do
      client = create(:client)
      get :show, id: client
      expect(response).to render_template :show
    end
  end
  
  describe "GET #index" do
    it "populates an array of all the clients" do
      smith = create(:client, name: 'Smith')
      jones = create(:client, name: 'Jones')
      get :index
      expect(assigns(:clients)).to match_array([smith, jones])
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET #edit" do
    it "assigns the requested client to @client" do
      client = create(:client)
      get :edit, id: client
      expect(assigns(:client)).to eq client
    end
    it "renders the :edit template" do
      client = create(:client)
      get :edit, id: client
      expect(response).to render_template :edit
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new client in the database" do
        expect{
          post :create, client: attributes_for(:client)
        }.to change(Client, :count).by(1)
      end
      it "redirects to the clients#show" do
        client = create(:client)
        get :show, id: client
        expect(response).to render_template :show
      end
    end
    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect{
          post :create, 
            client: attributes_for(:invalid_client)
          expect(response).to render_template :new
        }.not_to change(Client, :count)
      end
      it "re-renders the :new template" do
        post :create,
          client: attributes_for(:invalid_client)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @client = create(:client,
        name: "Example User")
    end
    context "with valid attributes" do
      it "locates the requested @client" do
        patch :update, id: @client, client: attributes_for(:client)
        expect(assigns(:client)).to eq(@client)
      end
      it "redirects to the contact" do
        patch :update, id: @client, client: attributes_for(:client)
        expect(response).to redirect_to @client        
      end
    end

    context "with invalid attributes" do
      it "does not change the contacts attributes" do
        patch :update, id: @client,
          client: attributes_for(:client, name: nil)
        @client.reload
        expect(@client.name).not_to eq 'John'
      end
      it "re-renders the :edit template" do
        patch :update, id: @client,
          client: attributes_for(:invalid_client)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @client = create(:client)
    end
    it "deletes the contact from the database" do
      expect{
        delete :destroy, id: @client
      }.to change(Client, :count).by(-1)
    end
    it "redirects to users#index" do
      delete :destroy, id: @client
      expect(response).to redirect_to :clients
    end
  end
end















