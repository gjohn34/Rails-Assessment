class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :make_profile

  def index
    #have to change below to current user
    @profile = Profile.friendly.find(current_user.profile.id) #currently AJ
    @messages = Message.where(profile_id: @profile.id)
  end

  def new
    @profile = Profile.friendly.find(params[:id])
  end

  def create
    @profile = Profile.friendly.find(params[:profile_id])
    data = params.require(:message).permit(:content)
    data[:profile_id] = @profile.id
    data[:sender_id] = current_user.profile.id
    @message = Message.create!(data)
    redirect_to root_path
  end

  private

  def make_profile
    if current_user.profile == nil
      flash[:notice] = "You need to create a profile first"
      redirect_to new_profile_path
    end
  end
end
