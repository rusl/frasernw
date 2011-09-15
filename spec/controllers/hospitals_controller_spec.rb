require File.dirname(__FILE__) + '/../spec_helper'

describe HospitalsController do
  fixtures :all
  # render_views
  
  before(:each) do
    controller.stub!(:logged_in?).and_return(true)
    # controller.class.skip_before_filter :login_required
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Hospital.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Hospital.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  # it "create action should redirect when model is valid" do
  #   Hospital.any_instance.stubs(:valid?).returns(true)
  #   post :create
  #   response.should redirect_to(hospital_path(assigns[:hospital].id))
  # end

  it "edit action should render edit template" do
    get :edit, :id => Hospital.first
    response.should render_template(:edit)
  end

  # it "update action should render edit template when model is invalid" do
  #   Hospital.any_instance.stubs(:valid?).returns(false)
  #   put :update, :id => Hospital.first
  #   response.should render_template(:edit)
  # end

  it "update action should redirect when model is valid" do
    Hospital.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Hospital.first
    response.should redirect_to(hospital_url(assigns[:hospital]))
  end

  it "destroy action should destroy model and redirect to index action" do
    hospital = Hospital.first
    delete :destroy, :id => hospital
    response.should redirect_to(hospitals_url)
    Hospital.exists?(hospital.id).should be_false
  end
end
