class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def show
    @user = User.find_by(id: params[:id])
  end
end
