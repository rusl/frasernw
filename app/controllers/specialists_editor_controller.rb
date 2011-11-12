class SpecialistsEditorController < ApplicationController
  skip_before_filter :login_required
  skip_authorization_check
  before_filter { |controller|  controller.send(:specialist_token_required, params[:token], params[:id]) }
  
  def edit
    @token      = params[:token]
    @specialist = Specialist.find(params[:id])
    @specialist.capacities.build if @specialist.capacities.count == 0
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
    if @specialist.update_attributes!(params[:specialist])
      redirect_to specialist_self_edit_path(@specialist), :notice => "You have successfully updated the information for #{@specialist.name}."
    else
      @token = params[:token]
      @specialist.capacities.build if @specialist.capacities.count == 0
      @specialization = @specialist.specialization
      @specialization_clinics = @specialization.clinics.collect { |clinic| [clinic.name, clinic.id] }.sort
      @specialist_clinics = @specialist.clinics.collect {|c| c.id}
      @view = @specialist.views.build(:notes => request.remote_ip)
      @view.save
      render :template => 'specialists/edit'
    end
  end

end
