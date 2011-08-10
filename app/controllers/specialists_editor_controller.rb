class SpecialistsEditorController < ApplicationController
  skip_before_filter :login_required
  before_filter :specialist_token_required
  
  def edit
    # TODO: before filter
    @specialist = Specialist.find(params[:id])
    @specialization_clinics = []
    @specialist_clinics = @specialist.clinics.collect {|c| c.id}
    render :template => 'specialists/edit'
  end

  def update
    params[:specialist][:procedure_ids] ||= []
    @specialist = Specialist.find(params[:id])
    render :action => 'edit'
  end

end
