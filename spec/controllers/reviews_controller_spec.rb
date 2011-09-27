require File.dirname(__FILE__) + '/../spec_helper'

describe ReviewsController do
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
    get :show, :id => 1
    response.should render_template(:show)
  end

  describe "PUT 'accept'" do
    it "should be successful" do
      # put 'accept'
      # response.should be_success
    end
  end

  describe "PUT 'reject'" do
    it "should be successful" do
      # put 'reject'
      # response.should be_success
    end
  end

end
