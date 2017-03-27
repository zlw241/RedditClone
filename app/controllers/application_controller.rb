class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :signed_in?

  def flash_errors(model)
    if model.nil?
      flash["errors"] = ["error, something went wrong"]
    else
      flash["errors"] = model.errors.full_messages
    end
  end

  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
  end

  def log_in(user)
    session[:session_token] = user.session_token
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def signed_in?
    !!current_user
  end

  def ensure_logged_in
    redirect_to new_session_url unless signed_in?
  end


end
