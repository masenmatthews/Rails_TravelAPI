class DestinationsController < ApplicationController
  TOKEN = "secret"

  before_action :authenticate, except: [ :index ]
  def index
    country = params[:country]
    @destination = Destination.search(country)
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

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    end
  end

end
