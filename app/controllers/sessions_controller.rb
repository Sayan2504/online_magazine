class SessionsController < ApplicationController
  before_action :set_user, only: :create
  
  def create
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to articles_path, flash: { success: "You have successfully logged in" }
    else
      flash.now[:danger] = "Email/Password combination is incorrect."
      render "new"
    end
  end

  def destroy
    return unless logged_in?
    log_out
    redirect_to root_path, flash: { danger: "User has been successfully logged out" }
  end

  def new
  end

  private

  def set_user
    @user = User.find_by(email: params[:session][:email].downcase)
  end
end
