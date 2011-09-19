class TrackerController < ApplicationController

def index
  @specialists = Specialist.find(:all)
end

end
