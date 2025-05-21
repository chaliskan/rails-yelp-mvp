class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review     = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to @restaurant
    else
      @restaurants = Restaurant.all
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
