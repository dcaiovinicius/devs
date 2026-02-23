class ErrorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout "application"

  def forbidden
    render "errors/forbidden", status: :forbidden
  end

  def not_found
    render "errors/not_found", status: :not_found
  end

  def unprocessable_entity
    render "errors/unprocessable_entity", status: :unprocessable_entity
  end

  def internal_server_error
    render "errors/internal_server_error", status: :internal_server_error
  end
end
