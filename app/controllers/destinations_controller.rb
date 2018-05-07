class DestinationsController < ApplicationController

  def index
    # @destinations = Destination.all
    # json_response(@destinations)
    country = params[:country]
    @destination = Destination.search(country)
    binding.pry
    json_response(@destination)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
   @destination = Destination.create!(destination_params)
   json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
       message: "Your destination has been updated successfully."
       }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def destination_params
    params.permit(:country, :city, :region)
  end
end
