class PageController < ApplicationController
  def index
    @developers = Developer.order(created_at: :desc).limit(6)
  end
end
