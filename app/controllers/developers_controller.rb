class DevelopersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_developer, only: %i[show edit update]
  before_action :redirect_if_has_profile, only: %i[new create]

  def index
    @developers = Developer.order(created_at: :desc)
  end

  def show
  end

  def new
    @developer = current_user.build_developer
  end

  def create
    @developer = current_user.build_developer(developer_params)

    if @developer.save
      redirect_to @developer, notice: "Developer created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @developer
  end

  def update
    authorize @developer

    if @developer.update(developer_params)
      redirect_to @developer, notice: "Developer updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_developer
    @developer = Developer.find(params[:id])
  end

  def redirect_if_has_profile
    redirect_to current_user.developer if current_user.developer.present?
  end

  def developer_params
    params.require(:developer)
          .permit(:available_on, :hero, :bio, :website, :github, :twitter, :avatar)
  end
end
