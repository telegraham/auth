class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      set_logged_in_user_id @user.id
      redirect_to "/"
    else
      @user ||= User.new(username: session_params[:username])
      @errors = ["Those credentials don't match anything we have in the database"]
      render :new
    end
  end

  def destroy
    clear_logged_in_user_id
    redirect_to "/"
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end