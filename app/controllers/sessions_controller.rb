class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = 'Welcome to Lucid Tracker'
      log_in user, remember: params[:session][:remember]
      render 'new'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
  end
end
