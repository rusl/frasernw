class SpecialistsController < ApplicationController
  load_and_authorize_resource

  def index
    # @specializations = Specialization.find(:all, :include => :specialists)
    redirect_to specializations_path, :notice => "Need to specify a specialization" unless params[:specialization_id]
    @specialization = Specialization.find(params[:specialization_id])
    @specialists = @specialization.specialists
  end

  def show
    @specialist = Specialist.find(params[:id])
    render :layout => false if request.headers['X-PJAX']
  end

  def new
    @specialization = Specialization.find(params[:specialization_id])
    @specialist     = @specialization.specialists.build
    @specialist.capacities.build
    @specialist.offices.build
    @specialization_clinics = @specialization.clinics.collect { |clinic| [clinic.name, clinic.id] }.sort
    @specialist_clinics = @specialist.clinics.collect {|c| c.id}    
  end

  def create
    @specialist = Specialist.new(params[:specialist])
    if @specialist.save!
      redirect_to @specialist, :notice => "Successfully created specialist. #{undo_link}"
    else
      render :action => 'new'
    end
  end

  def edit
    @specialization = Specialization.find(params[:specialization_id])
    @specialist = Specialist.find(params[:id])
    if @specialist.capacities.count == 0
      @specialist.capacities.build
    end
    @specialization_clinics = @specialization.clinics.collect { |clinic| [clinic.name, clinic.id] }.sort
    @specialist_clinics = @specialist.clinics.collect {|c| c.id}
  end

  def update
    @specialist = Specialist.find(params[:id])
    if @specialist.update_attributes!(params[:specialist])
      redirect_to @specialist, :notice => "Successfully updated specialist. #{undo_link}"
    else
      render :edit
    end
  end

  def destroy
    @specialist = Specialist.find(params[:id])
    @specialist.destroy
    redirect_to specialists_url, :notice => "Successfully destroyed specialist. #{undo_link}"
  end

  def undo_link
    view_context.link_to("undo", revert_version_path(@specialist.versions.scoped.last), :method => :post).html_safe
  end

  def email
    @specialist = Specialist.find params[:id]
    SpecialistMailer.invite_specialist(@specialist).deliver
    @contact = @specialist.contacts.build(:user_id => current_user, :notes => @specialist.contact_email)
    @contact.save
    redirect_to @specialist, :notice => "Sent email to #{@specialist.contact_email}"
  end
  
end
