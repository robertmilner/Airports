class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Signed in.'
    else
      redirect_to login_url, :notice => 'Incorrect email or password.'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out.'
  end
end
