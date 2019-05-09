class SearchController < ApplicationController
  def index
    search_term = params[:search]
    # render :html => search_term
    @profiles = Interest.find_by(interest:search_term).profiles
    @profiles = @profiles.where.not(id: current_user.profile.id)
  end
end
