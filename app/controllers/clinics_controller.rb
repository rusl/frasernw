class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.all
  end

  def show
    @clinic = Clinic.find(params[:id])
    render :layout => false if request.headers['X-PJAX']
  end

  def new
    @clinic = Clinic.new
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
