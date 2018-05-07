class ReviewController < ApplicationController




  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:title, :rating, :body)
  end
end
