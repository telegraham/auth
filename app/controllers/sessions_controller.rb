class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      redirect_to "/"
    else
      @user ||= User.new(username: session_params[:username])
      @errors = ["Those credentials don't match anything we have in the database"]
      render :new
    end
  end

  def destroy

  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end