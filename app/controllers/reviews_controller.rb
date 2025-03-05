class ReviewsController < ApplicationController

  def index

  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    # raise
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end
end
