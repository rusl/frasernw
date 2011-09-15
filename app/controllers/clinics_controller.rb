class ClinicsController < ApplicationController
  def index
    unless params[:specialization_id]
      redirect_to specializations_path, :notice => "Need to specify a specialization" and return
    else
      @specialization = Specialization.find(params[:specialization_id])
      @clinics = Clinic.all
    end
  end

  def show
    @clinic = Clinic.find(params[:id])
    render :layout => false if request.headers['X-PJAX']
  end

  def new
    unless params[:specialization_id]
      redirect_to specializations_path, :notice => "Need to specify a specialization" and return
    else
      @specialization = Specialization.find(params[:specialization_id])
      @clinic = Clinic.new
    end
  end

  def create
    @clinic = Clinic.new(params[:clinic])
    if @clinic.save
      redirect_to @clinic, :notice => "Successfully created clinic."
    else
      render :action => 'new'
    end
  end

  def edit
    @clinic = Clinic.find(params[:id])
  end

  def update
    @clinic = Clinic.find(params[:id])
    if @clinic.update_attributes(params[:clinic])
      redirect_to @clinic, :notice  => "Successfully updated clinic."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy
    redirect_to clinics_url, :notice => "Successfully destroyed clinic."
  end
end
