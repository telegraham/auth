class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def clear_logged_in_user_id
    session.delete(:user_id)
  end

  def set_logged_in_user_id(user_id)
    session[:user_id] = user_id
  end

end
