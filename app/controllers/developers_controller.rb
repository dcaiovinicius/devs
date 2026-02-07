class DevelopersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :authorize_owner!, only: %i[edit update]

  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def new
    # Check if the user already has a developer
    return redirect_to current_user.developer if current_user.developer

    @developer = current_user.build_developer
  end

  def edit
    @developer = current_user.developer
  end

  def update
    if @developer.update(developer_params)
      redirect_to @developer, notice: "Developer was successfully updated."
    else
      render :edit
    end
  end

  def create
    @developer = current_user.build_developer(developer_params)

    if @developer.save
      redirect_to @developer, notice: "Developer was successfully created."
    else
      render :new
    end
  end

  private
  def developer_params
    params.require(:developer).permit(:available_on, :hero, :bio, :website, :github, :twitter, :avatar)
  end

  def authorize_owner!
    @developer = Developer.find(params[:id])

    if @developer.user != current_user
      redirect_to root_path, alert: "Not authorized", status: :unauthorized and return
    end
  end
end
