class SearchController < ApplicationController
  def index
    search_term = params[:search]
    #searching and retrieving all profiles that are interested in the thing
    #that was send throug the form
    @profiles = Interest.find_by(interest:search_term.downcase)
    if @profiles != nil
      @profiles = @profiles.profiles
      @profiles = @profiles.where.not(id: current_user.profile.id) if !@profiles.nil?
    end
  end
end
