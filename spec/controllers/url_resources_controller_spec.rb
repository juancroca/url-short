require 'spec_helper'

describe UrlResourcesController do
  
  before(:each) do 
    @user = create(:user)
    sign_in :user, @user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code).to eq("200")
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the url_resources into @url_resources" do
      url_resource1, url_resource2 = create(:url_resource, user: @user), create(:url_resource, user: @user)
      get :index

      expect(assigns(:url_resources)).to match_array([url_resource1, url_resource2])
    end
  end

  describe 'GET #show' do
    before(:each) do 
      @url_resource = create(:url_resource, user: @user)
    end
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: @url_resource 
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
    
    it "renders the show template" do
      get :show, id: @url_resource
      expect(response).to render_template("show")
    end

    it "assigns the requested UrlResource to @url_resources" do
      get :show, id: @url_resource

      expect(assigns(:url_resource)).to eq(@url_resource)
    end
  end

  describe 'GET #short' do
    before(:each) do 
      @url_resource = create(:url_resource, user: @user)
    end
    
    it "redirect the url_string" do
      get :short, id: @url_resource.token
      expect(response).to redirect_to(@url_resource.url_string)
    end

    it "assigns the requested UrlResource to @url_resources" do
      get :short, id: @url_resource.token

      expect(assigns(:url_resource)).to eq(@url_resource)
    end
  end

  describe 'GET #new' do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.code).to eq("200")
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "assigns a new UrlResource to @url_resources" do
      get :new
      assigns(:url_resource).should be_a_new(UrlResource)
    end
  end

  describe "POST #create" do
    
    context "with valid attributes" do
      it "saves the new message in the database" do expect{
          post :create, url_resource: attributes_for(:url_resource)
        }.to change(UrlResource, :count).by(1)
      end
      it "redirects to the home page" do
        post :create, url_resource: attributes_for(:url_resource)
        url_resource = UrlResource.last
        response.should redirect_to url_resource_url(url_resource)
      end
    end

    context "with invalid attributes" do
      it "does not save the new message in the database" do
        expect{
          post :create, url_resource: attributes_for(:invalid_url_resource)
        }.to_not change(UrlResource, :count)
      end
      
      it "re-renders the :new template" do 
        post :create, url_resource: attributes_for(:invalid_url_resource) 
        response.should render_template :new
      end
    end 
  end

end
