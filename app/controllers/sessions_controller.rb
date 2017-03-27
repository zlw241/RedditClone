class SessionsController < ApplicationController

  def new

  end

  def create
    username = session_params[:username]
    password = session_params[:password]
    user = User.find_by_credentials(username, password)
    if user
      log_in(user)
      redirect_to subs_url
    else
      flash_errors(user)
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
