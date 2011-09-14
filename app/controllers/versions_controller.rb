class VersionsController < ApplicationController

  def index
    klass = params[:model].singularize.camelize.constantize
    @item = klass.find params[:id]
    @versions = @item.versions
  end
  
  def show
    @version = Version.find(params[:id])
    @klass = @version.reify.class.to_s.downcase
    eval("@#{@klass} = @version.reify" )
    @is_version = true
    render :template => "#{@klass.pluralize}/show"
  end

  def show_all
    @versions = Version.order('id desc').paginate(:page => params[:page], :per_page => 50)
  end

  def revert
    @version = Version.find(params[:id])
    if @version.reify
      @version.reify.save!
    else
      if @version.item.specialization
        klass = @version.item.specialization.class.to_s.downcase.pluralize.to_sym
        @version.item.destroy
        redirect_to klass and return
      else
        redirect_to '/' and return
      end
    end
    link_name = params[:redo] == "true" ? "undo" : "redo"
    link = view_context.link_to(link_name, revert_version_path(@version.next, :redo => !params[:redo]), :method => :post)
    redirect_to :back, :notice => "Undid #{@version.event}. #{link}"
  end

end

