class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to '/', notice: 'Logged in!'
    else
      redirect_to '/login', notice: 'Your email and/or password are incorrect.'
    end
  end

  def destroy
    # Use 'reset session' to completely destroy all session data
    reset_session
    redirect_to '/', notice: 'Logged out!'
  end
end
