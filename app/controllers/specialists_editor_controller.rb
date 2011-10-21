class SpecialistsEditorController < ApplicationController
  skip_before_filter :login_required
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
    PaperTrail.whodunnit = "MOA"
    @specialist.attributes = params[:specialist]
    if @specialist.valid?
      Review.create({
          :item_type => @specialist.class.name,
          :item_id => @specialist.id,
          :object => @specialist.attributes.to_yaml,
          :whodunnit => current_user,
          :object_changes => @specialist.changes})
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
