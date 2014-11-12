class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice:'Logged in successfully.'
    else
      render 'new', alert:'Invalid username or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice:'Logged out successfully.'
  end
end
