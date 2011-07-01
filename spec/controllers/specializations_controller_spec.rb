require File.dirname(__FILE__) + '/../spec_helper'

describe SpecializationsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Specialization.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  # it "create action should render new template when model is invalid" do
  #   Specialization.any_instance.stubs(:valid?).returns(false)
  #   post :create
  #   response.should render_template(:new)
  # end

  it "create action should redirect when model is valid" do
    Specialization.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(assigns[:specialization])
  end

  it "edit action should render edit template" do
    get :edit, :id => Specialization.first
    response.should render_template(:edit)
  end

  # it "update action should render edit template when model is invalid" do
  #   Specialization.any_instance.stubs(:valid?).returns(false)
  #   put :update, :id => Specialization.first
  #   response.should render_template(:edit)
  # end

  it "update action should redirect when model is valid" do
    Specialization.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Specialization.first
    response.should redirect_to(specialization_url(assigns[:specialization]))
  end

  it "destroy action should destroy model and redirect to index action" do
    specialization = Specialization.first
    delete :destroy, :id => specialization
    response.should redirect_to(specializations_url)
    Specialization.exists?(specialization.id).should be_false
  end
end
