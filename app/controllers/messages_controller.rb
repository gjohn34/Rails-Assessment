class MessagesController < ApplicationController

  def index
    #have to change below to current user
    # @profile = Profile.friendly.find(4)
    # @messages = Message.where(profile_id: @profile.id)
  end

  def new
    @profile = Profile.friendly.find(params[:id])
  end

  def create
    @profile = Profile.friendly.find(params[:profile_id])
    data = params.require(:message).permit(:content, :sender_id)
    data[:profile_id] = @profile.id
    @message = Message.create!(data)
    redirect_to root_path
  end
end
