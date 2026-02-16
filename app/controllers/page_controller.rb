class PageController < ApplicationController
  def index
    @developers = Developer.all().limit(10)
  end
end
