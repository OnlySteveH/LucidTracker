class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.match_digest?(:activation, params[:id])
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = 'Account activated!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link'
      # redirect_to root_url # we don't have root path yet
    end
  end
end
