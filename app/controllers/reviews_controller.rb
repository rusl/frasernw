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
    object = review.reify
    object.class.paper_trail_off
    object.save!
    object.class.paper_trail_on
    review.destroy
    redirect_to reviews_path, :notice => "Changes Rejected"
  end
end
