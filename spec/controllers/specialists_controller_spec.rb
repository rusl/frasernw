require File.dirname(__FILE__) + '/../spec_helper'

describe SpecialistsController do
  fixtures :all
  # render_views

  it "index action should render index template" do
    get :index, :specialization_id => Specialization.first
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Specialist.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new, :specialization_id => Specialization.first
    response.should render_template(:new)
  end

# FIXME
  # it "create action should render new template when model is invalid" do
  #   Specialist.any_instance.stubs(:valid?).returns(false)
  #   post :create
  #   response.should render_template(:new)
  # end


  it "create action should redirect when model is valid" do
    Specialist.any_instance.stubs(:valid?).returns(true)
    post :create, :specialist => {:firstname => 'joe', :lastname => 'blow', :specialization_id => Specialization.first }
    response.should render_template(assigns[:specialist])
  end

  it "edit action should render edit template" do
    get :edit, :id => Specialist.first, :specialization_id => Specialization.first
    response.should render_template(:edit)
  end

  # it "update action should render edit template when model is invalid" do
  #   Specialist.any_instance.stubs(:valid?).returns(false)
  #   put :update, :id => Specialist.first
  #   response.should render_template(:edit)
  # end

  it "update action should redirect when model is valid" do
    Specialist.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Specialist.first, :specialization_id => Specialization.first, :specialist => {}
    response.should redirect_to(specialist_url(assigns[:specialist]))
  end

  it "destroy action should destroy model and redirect to index action" do
    specialist = Specialist.first
    delete :destroy, :id => specialist
    response.should redirect_to(specialists_url)
    Specialist.exists?(specialist.id).should be_false
  end
end
