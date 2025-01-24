class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def route_not_found
    render json: { error: 'Route not found' }, status: :not_found
  end

  private

  def record_invalid(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def parameter_missing(exception)
    render json: { error: "Missing required parameter: #{exception.param}" }, status: :bad_request
  end
end
