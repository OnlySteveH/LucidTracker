class UsersController < ApplicationController
  def new; end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to @user
    else
      render 'users/new'
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
