class ProfilesController < ApplicationController
  #authenticate_user only on the new and edit methods
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :set_profile, only: [:show, :edit, :update, :update_interests, :update_likes]

  def index
    #find all profiles on the root path, if user has a profile theirs is excluded from the results
    @profiles = Profile.all
    if user_signed_in? && current_user.profile != nil
      @profiles = Profile.where.not(id: current_user.profile.id)
    else
      @profiles = Profile.all
    end
  end

  def new
    #create a new Profile
    @profile = Profile.new
    #give the user the option to set their likes on the New view
    # @interests = Interest.all
  end

  def create
    #create a new Profile, inferring the user_id based on their devise user_id
    data = profile_params
    data[:user_id] = current_user.id
    @profile = Profile.new(data)
    #if a profile pic is attached, it will be slugged into the user profile
    #other wise the default is selected.
    @profile.pic.attach(profile_params[:pic])

    #on profile creation, an instance of the Like class is created that matches them
    if @profile.save
      Like.create!(profile_id: @profile.id)
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
    #searches for all profiles that like the current user
    @result = Like.find_by_sql "SELECT profile_id FROM likes_profiles WHERE like_id = #{@profile.id}"
    @likes = {}
    @result.each do |like|
      @likes[like.profile_id] = Profile.find(like.profile_id)
    end
  end

  def edit
  end

  def update
    @profile = Profile.friendly.find(params[:profile_id])

    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def update_interests
    #empty array is created then for each of the selected inputs they are added
    #to the profile
    @profile.interests = []
    params[:interests].each do |i|
      @profile.interests.push(Interest.find(i))
    end
    @profile.save
    redirect_to profile_path(@profile)
  end

  def update_likes#(home = false)

    #when liking another profile, the 'liker' is added to the "likee's" list of 'likers'
    #when the 'likee' visits their own page they can see and like back.

    liker = current_user.profile
    liker.likes.push(Like.find(@profile.id))
    # if home == true
    #   render profile_path(current_user)
    # else
    #   flash[:notice] = "Wow, great choice!"
    #   render :show
    # end
    flash[:notice] = "Wow, great choice!"
    render :show
  end

  def photos
    #show all photos
    @profile = Profile.friendly.find(params[:profile_id])
  end

  def interests
    #show all available interests to the profile
    @profile = Profile.friendly.find(params[:profile_id])
    @interests = Interest.all
  end

  def matches
    #finding all the profiles that I like
    @my_likes = Profile.friendly.find(current_user.profile.id).likes
    #then finding all the profiles that like me
    @people_who_like_me = Like.find_by_sql "SELECT profile_id FROM likes_profiles WHERE like_id = #{current_user.profile.id}"
    #adding each profile to an available array to use in the views.
    #there was a better way to this but i am to afraid to change anything and break it.
    @profiles = []
    @people_who_like_me.each do |like|
      @profiles.push(Profile.find(like.profile_id))
    end
  end

  def hookup
  end

  private
  def set_profile
    @profile = Profile.friendly.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :pic, photos: [])
  end
end
