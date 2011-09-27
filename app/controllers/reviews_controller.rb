class ReviewsController < ApplicationController
  def index
    @reviews = Review.paginate(:page => params[:page], :per_page => 50)
  end

  def accept
    review = Review.find(params[:review_id])
    review.accept
    redirect_to reviews_path, :notice => "Changes Accepted"
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path, :notice => "Changes Rejected"
  end

end
