class SpecialistsController < ApplicationController

  def index
    # @specializations = Specialization.find(:all, :include => :specialists)
    @specialization = Specialization.find(params[:specialization_id])
    @specialists = @specialization.specialists
  end

  def show
    @specialist = Specialist.find(params[:id])
    render :layout => false if request.headers['X-PJAX']
  end

  def new
    @specialization = Specialization.find(params[:specialization_id])
    @specialist     = Specialist.new :specialization_id => @specialization.id
    @specialization_clinics = @specialization.clinics.collect { |clinic| [clinic.name, clinic.id] }.sort
    @specialist_clinics = @specialist.clinics.collect {|c| c.id}
  end

  def create
    @specialist = Specialist.new(params[:specialist])
    if @specialist.save
      redirect_to @specialist, :notice => "Successfully created specialist."
    else
      render :action => 'new'
    end
  end

  def edit
    @specialization = Specialization.find(params[:specialization_id])
    @specialist = Specialist.find(params[:id])
    @specialization_clinics = @specialization.clinics.collect { |clinic| [clinic.name, clinic.id] }.sort
    @specialist_clinics = @specialist.clinics.collect {|c| c.id}
  end

  def update
    params[:specialist][:procedure_ids] ||= []
    @specialist = Specialist.find(params[:id])
    if @specialist.update_attributes(params[:specialist])
      redirect_to @specialist, :notice  => "Successfully updated specialist."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @specialist = Specialist.find(params[:id])
    @specialist.destroy
    redirect_to specialists_url, :notice => "Successfully destroyed specialist."
  end
end
