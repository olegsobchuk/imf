class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    if @session.valid?
      session[:user_id], session[:user_type] = @session.user_id, @session.user_type
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
