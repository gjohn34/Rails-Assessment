class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.pic.attach(profile_params[:pic])

    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
  end

  private
  def set_profile
    @profile = Profile.friendly.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :pic)
  end
end
