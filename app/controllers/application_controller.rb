class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  include Pundit::Authorization

  include Pagy::Method

  rescue_from Pundit::NotAuthorizedError do
    flash.now[:alert] = "Você não tem permissão para esta ação."
    render "errors/forbidden", status: :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do
    render "errors/not_found", status: :not_found
  end
end
