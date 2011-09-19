class SpecialistsEditorController < ApplicationController
  skip_before_filter :login_required
  before_filter { |controller|  controller.send(:specialist_token_required, params[:token], params[:id]) }
  
  def edit
    @token      = params[:token]
    @specialist = Specialist.find(params[:id])
    @specialization = @specialist.specialization
    @specialization_clinics = @specialization.clinics.collect { |clinic| [clinic.name, clinic.id] }.sort
    @specialist_clinics = @specialist.clinics.collect {|c| c.id}
    @view = @specialist.views.build(:notes => request.remote_ip)
    @view.save
    render :template => 'specialists/edit'
  end

  def update
    params[:specialist][:procedure_ids] ||= []
    @specialist = Specialist.find(params[:id])
    if @specialist.update_attributes(params[:specialist])
      @edit = @specialist.edits.build(:notes => request.remote_ip)
      @edit.save
      redirect_to edit_specialist(@specialist), :notice => "Successfully updated."
    else
      render :action => 'edit'
    end
  end

end
