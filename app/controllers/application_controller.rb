class ApplicationController < ActionController::Base
  include ControllerAuthentication
  before_filter :login_required
  protect_from_forgery

  def info_for_paper_trail
    { to_review: (!current_user.admin? rescue true) }
  end
end
