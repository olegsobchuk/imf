class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    if @session.valid?
      session[:user_id] = cookies.signed[:user] = @session.user_id
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    reset_session
    cookies.delete(:user)
    redirect_to :root
  end
end
