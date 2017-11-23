class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = 'You signed up successfully'
      redirect_to @user
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

def edit
    @user = User.find_by(id: params[:id])
  end

 def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'You signed up successfully'
      redirect_to @user
    else
      render 'users/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
