class SpecialistsEditorController < ApplicationController
  skip_before_filter :login_required
  before_filter { |controller|  controller.send(:specialist_token_required, params[:token], params[:id]) }
  
  def edit
    # specialist_token_required(params[:token])
    # TODO: before filter
    @token      = params[:token]
    @specialist = Specialist.find(params[:id])
    @specialization = @specialist.specialization
    @specialization_clinics = @specialization.clinics.collect { |clinic| [clinic.name, clinic.id] }.sort
    @specialist_clinics = @specialist.clinics.collect {|c| c.id}
    render :template => 'specialists/edit'
  end

  def update
    params[:specialist][:procedure_ids] ||= []
    @specialist = Specialist.find(params[:id])
    render :action => 'edit'
  end

end
