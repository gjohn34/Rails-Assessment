class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
    @interests = Interest.all
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.pic.attach(profile_params[:pic])

    if @profile.save
      Like.create!(profile_id: @profile.id)
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def update_interests
    @profile = Profile.friendly.find(params[:profile_id])
    params[:interests].each do |i|
      @profile.interests.push(Interest.find(i))
    end
    @profile.save
  end

  def update_likes
    liker = Profile.friendly.find(2)
    @profile = Profile.friendly.find(params[:id])
    liker.likes.push(Like.find(@profile.id))
    # raise liker.inspect
    # raise @profile.inspect
  end

  def photos
    @profile = Profile.friendly.find(params[:profile_id])
  end

  def interests
    @profile = Profile.friendly.find(params[:profile_id])
    @interests = Interest.all
  end

  private
  def set_profile
    @profile = Profile.friendly.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :pic, photos: [])
  end
end
