class ReviewsController < ApplicationController

  def index
    @destinations = Destination.find(params[:destination_id])
    @reviews = @destinations.reviews
    json_response(@reviews)
  end

  def show
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: { message: 'Your review has been updated successfully'}
    else
      render status: 422, json: { message: 'Review not updated error 422'}
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    if @review.destroy
      render status: 200, json: {message: 'Your review has been destroyed'}
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:title, :rating, :body )
  end
end
