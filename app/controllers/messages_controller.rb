class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :make_profile

  def index
    #find all messages that belong to current_user
    @messages = Message.where(profile_id: current_user.profile.id)
  end

  def new
    #page to create new message
    @profile = Profile.friendly.find(params[:id])
  end

  def create
    #POST takes params submitted by form, infers sender and reciever ids on data then
    #creates new message with data then redirects back to the root path
    @profile = Profile.friendly.find(params[:profile_id])
    data = params.require(:message).permit(:content)
    data[:profile_id] = @profile.id
    data[:sender_id] = current_user.profile.id
    @message = Message.create!(data)
    redirect_to root_path
  end

  private

  def make_profile
    #redirect user to create a profile if they do things that require them to create a profile
    if current_user.profile == nil
      flash[:notice] = "You need to create a profile first"
      redirect_to new_profile_path
    end
  end
end
