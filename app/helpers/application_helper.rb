module ApplicationHelper

  def logged_in_user_id
    session[:user_id]
  end

  def logged_in_user
    @user ||= User.find(logged_in_user_id)
  end

  def logged_in?
    !!logged_in_user_id
  end

end
