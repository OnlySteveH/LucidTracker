class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find(params[:session][:email])
  end

  def destroy
  end
end
