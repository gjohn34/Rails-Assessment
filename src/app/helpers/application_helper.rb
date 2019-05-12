module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  def resource_class
    devise_mapping.to
  end

  def show_user_buttons(link)
    if user_signed_in? && current_user.profile != nil && current_user.profile.user_id == @profile.user_id
      link
    end
  end

end
