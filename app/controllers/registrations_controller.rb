class RegistrationsController < ApplicationController
  def new
    @user = Developer.new
  end

  def create
    @user = Developer.new(user_params)
    if @user.valid? && @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:developer).permit(:email, :password, :password_confirmation)
  end
end
