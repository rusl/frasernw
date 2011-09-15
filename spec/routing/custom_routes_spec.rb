require "spec_helper"

describe "routes for custom routes" do
  it "routes root to users#show" do
    get("/").
    should route_to( :controller => "specializations", :action => "index")
  end
end