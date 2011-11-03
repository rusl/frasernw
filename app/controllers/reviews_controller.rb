class ReviewsController < ApplicationController
  load_and_authorize_resource

  def index
    @versions = Version.needs_review.paginate(:page => params[:page], :per_page => 50)
  end

  def accept
    review = Review.find(params[:review_id])
    review.accept
    redirect_to reviews_path, :notice => "Changes Accepted"
  end

  def destroy
    review = Review.find(params[:id])
    review.reject!
    review.destroy
    redirect_to reviews_path, :notice => "Changes Rejected"
  end
end
