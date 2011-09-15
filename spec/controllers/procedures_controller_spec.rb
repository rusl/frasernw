require File.dirname(__FILE__) + '/../spec_helper'

describe ProceduresController do
  fixtures :all
  # render_views
  before(:each) do
    controller.stub!(:logged_in?).and_return(true)
    # controller.class.skip_before_filter :login_required
  end

  # it "index action should render index template" do
  #   get :index, :specialization_id => Specialization.first
  #   response.should render_template(:index)
  # end

  it "show action should render show template" do
    get :show, :id => Procedure.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new, :specialization_id => Specialization.first
    response.should render_template(:new)
  end

  # it "create action should render new template when model is invalid" do
  #   Procedure.any_instance.stubs(:valid?).returns(false)
  #   post :create
  #   response.should redirect_to(new_procedure_path)
  # end

  it "create action should render show tempalte when model is valid" do
    Procedure.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should render_template(assigns[:procedure])
  end

  it "edit action should render edit template" do
    get :edit, :id => Procedure.first
    response.should render_template(:edit)
  end

  # it "update action should render edit template when model is invalid" do
  #   Procedure.any_instance.stubs(:valid?).returns(false)
  #   put :update, :id => Procedure.first
  #   response.should render_template(:edit)
  # end

  it "update action should redirect when model is valid" do
    Procedure.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Procedure.first, :specialization_id => Specialization.first
    response.should redirect_to(procedure_url(assigns[:procedure]))
  end

  it "destroy action should destroy model and redirect to index action" do
    procedure = Procedure.first
    delete :destroy, :id => procedure
    response.should redirect_to(procedures_url)
    Procedure.exists?(procedure.id).should be_false
  end
end
