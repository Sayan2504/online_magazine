class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to articles_path, flash: { success: "You have successfully signed up" } 
    else
      flash.now[:danger] = "You already have an account/Your credentials are not valid"
      render "new"
    end
  end

  def edit
  end

  def new
    if logged_in?
      redirect_to root_path, flash: { warning: "You have already logged in" }
      return
    end
    @user = User.new
  end

  def update
    if @user.update(user_params)
      redirect_to articles_path, flash: { success: "Email/Password has been successfully updated" }
    else
      render "edit"
    end
  end

  private
  
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
