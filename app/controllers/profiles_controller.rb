class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params.require(:profile).permit(:name, :bio))

    if @profile.save
      render :show, location: @profile
    else
      render :new
    end
  end

  def show
  end

  private
  def set_profile
    @profile = Profile.find(params[:id])
  end
end
