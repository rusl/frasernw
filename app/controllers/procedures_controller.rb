class ProceduresController < ApplicationController
  def index
    if params[:specialization_id] != nil
      @specialization = Specialization.find params[:specialization_id]
      @procedures = @specialization.procedures
    else
      redirect_to 'specializations#index' and return
    end
  end

  def show
    @procedure = Procedure.find(params[:id])
    if request.headers['X-PJAX']
      render :layout => false
    end
  end

  def new
    @specialization = Specialization.find(params[:specialization_id])
    @procedure = Procedure.new :specialization_id => @specialization.id
  end

  def create
    @procedure = Procedure.new(params[:procedure])
    if @procedure.save
      redirect_to @procedure, :notice => "Successfully created procedure."
    else
      render :action => 'new'
    end
  end

  def edit
    @procedure = Procedure.find(params[:id])
  end

  def update
    debugger
    @procedure = Procedure.find(params[:id])
    if @procedure.update_attributes(params[:procedure])
      redirect_to @procedure, :notice  => "Successfully updated procedure."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    redirect_to procedures_url, :notice => "Successfully destroyed procedure."
  end
end
