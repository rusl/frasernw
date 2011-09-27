class ReviewsController < ApplicationController
  def index
    @reviews = Review.paginate(:page => params[:page], :per_page => 50)
  end

  def show
  end

  def accept
    render :nothing
  end

  def reject
    render :nothing
  end

end
