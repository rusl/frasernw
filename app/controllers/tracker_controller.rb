class TrackerController < ApplicationController
  load_and_authorize_resource

  def index
    @specialists = Specialist.find(:all)
  end

end
