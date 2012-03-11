require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SitesController do

  # This should return the minimal set of attributes required to create a valid
  # Site. As you add validations to Site, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:zipcode => 94530, :name => 'El Cerrito'}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SitesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do

    it "has a 200 status code" do
      get :index#, :projects_id => 1
      response.code.should eq("200")
    end

    it "assigns all sites as @sites" do
      site = Site.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sites).should eq([site])
    end
  end

  describe "GET show" do
    it "assigns the requested site as @site" do
      site = Site.create! valid_attributes
      get :show, {:id => site.to_param}, valid_session
      assigns(:site).should eq(site)
    end
  end

  describe "GET new" do
    it "assigns a new site as @site" do
      get :new, {}, valid_session
      assigns(:site).should be_a_new(Site)
    end
  end

  describe "GET edit" do
    xit "assigns the requested site as @site" do
      site0 = Site.create! valid_attributes
      p site0.to_param
      project = Factory.create(:project)
      site = project.sites.create! valid_attributes
      p site.to_param
      get :edit, {:id => site.to_param}, valid_session
      assigns(:site).should eq(site)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Site" do
        expect {
          post :create, {:site => valid_attributes}, valid_session
        }.to change(Site, :count).by(1)
      end

      xit "assigns a newly created site as @site" do
        post :create, {:site => valid_attributes}, valid_session
        assigns(:site).should be_a(Site)
        assigns(:site).should be_persisted
      end

      xit "redirects to the created site" do
        post :create, {:site => valid_attributes}, valid_session
        response.should redirect_to(Site.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site as @site" do
        # Trigger the behavior that occurs when invalid params are submitted
        Site.any_instance.stub(:save).and_return(false)
        post :create, {:site => {}}, valid_session
        assigns(:site).should be_a_new(Site)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Site.any_instance.stub(:save).and_return(false)
        post :create, {:site => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested site" do
        site = Site.create! valid_attributes
        # Assuming there are no other sites in the database, this
        # specifies that the Site created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Site.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => site.to_param, :site => {'these' => 'params'}}, valid_session
      end

      xit "assigns the requested site as @site" do
        site = Site.create! valid_attributes
        put :update, {:id => site.to_param, :site => valid_attributes}, valid_session
        assigns(:site).should eq(site)
      end

      xit "redirects to the site" do
        #site = Site.create! valid_attributes
        project = Factory(:project)
        site = project.sites.create! valid_attributes
        put :update, {:id => site.to_param, :site => valid_attributes}, valid_session
        response.should redirect_to(project_site_path)
      end
    end

    describe "with invalid params" do
      it "assigns the site as @site" do
        site = Site.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Site.any_instance.stub(:save).and_return(false)
        put :update, {:id => site.to_param, :site => {}}, valid_session
        assigns(:site).should eq(site)
      end

      it "re-renders the 'edit' template" do
        site = Site.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Site.any_instance.stub(:save).and_return(false)
        put :update, {:id => site.to_param, :site => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested site" do
      site = Site.create! valid_attributes
      expect {
        delete :destroy, {:id => site.to_param}, valid_session
      }.to change(Site, :count).by(-1)
    end

    it "redirects to the sites list" do
      site = Site.create! valid_attributes
      delete :destroy, {:id => site.to_param}, valid_session
      response.should redirect_to(sites_url)
    end
  end

end
