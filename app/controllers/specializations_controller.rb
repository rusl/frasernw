class SpecializationsController < ApplicationController
  def index
    @specializations = Specialization.all
  end

  def show
    @specialization = Specialization.find(params[:id])
    render :layout => false if request.headers['X-PJAX']
  end

  def new
    @specialization = Specialization.new
  end

  def create
    @specialization = Specialization.new(params[:specialization])
    if @specialization.save
      redirect_to @specialization, :notice => "Successfully created specialization."
    else
      render :action => 'new'
    end
  end

  def edit
    @specialization = Specialization.find(params[:id])
  end

  def update
    @specialization = Specialization.find(params[:id])
    if @specialization.update_attributes(params[:specialization])
      redirect_to @specialization, :notice  => "Successfully updated specialization."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @specialization = Specialization.find(params[:id])
    @specialization.destroy
    redirect_to specializations_url, :notice => "Successfully destroyed specialization."
  end
end
