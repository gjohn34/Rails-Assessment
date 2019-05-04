class ProfilesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :set_profile, only: [:show, :edit, :update]
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
    @interests = Interest.all
  end

  def create
    data = profile_params
    data[:user_id] = current_user.id
    @profile = Profile.new(data)
    @profile.pic.attach(profile_params[:pic])

    if @profile.save
      Like.create!(profile_id: @profile.id)
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
    @result =Like.find_by_sql "SELECT profile_id FROM likes_profiles WHERE like_id = #{@profile.id}"
    @likes = {}
    @result.each do |like|
      @likes[like.profile_id] = Profile.find(like.profile_id)
    end
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
    @profile.interests = []
    params[:interests].each do |i|
      @profile.interests.push(Interest.find(i))
    end
    @profile.save
    redirect_to profile_path(@profile)
  end

  def update_likes
    liker = current_user.profile
    # raise current_user.inspect
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
