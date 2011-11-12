class ProceduresController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:specialization_id] != nil
      @specialization = Specialization.find params[:specialization_id]
      @procedures = @specialization.procedures
      redirect_to specialization_procedures_path(@specialization, @specialization.procedures) and return
    else
      redirect_to specialization_path(@specialization) and return
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
      redirect_to @procedure, :notice => "Successfully created scope of practice."
    else
      render :action => 'new'
    end
  end

  def edit
    @procedure = Procedure.find(params[:id])
  end

  def update
    @procedure = Procedure.find(params[:id])
    if @procedure.update_attributes(params[:procedure])
      redirect_to @procedure, :notice  => "Successfully updated scope of practice."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    # redirect_to '/specializations', :notice => "Successfully destroyed scope of practice."
    redirect_to procedures_url, :notice => "Successfully destroyed procedure."
  end
end
