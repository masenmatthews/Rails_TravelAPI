class ReviewsController < ApplicationController

  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    @review = Review.find(params[:id])
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @review = @destination.destinations.new(review_params)
    if @destination.save
      flash[:notice] = "Destination successfully added!"
      redirect_to destination_path(@destination)
    else
      render :new
    end
  end

  def update
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to destination_path(@destination)
    else
      render :edit
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to destination_path(@destination)
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:title, :rating, :body)
  end
end
