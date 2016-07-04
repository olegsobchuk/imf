class ProfilesController < ApplicationController
  before_action :require_user
  before_action :profile, except: :geo

  def update
    @profile.update(profile_params)
    redirect_to current_user
  end

  def avatar
    @profile.avatar = params[:avatar]
    if profile.valid? && profile.save
    else
      flash[:avatar] = 'Wrong avatar upload'
    end
    redirect_to :back
  end

  def geo
    @locations = LocationService.geo(params[:address])
    respond_to do |format|
      format.js { render 'geo'}
    end
  end

  private

  def profile_params
    params.require(:profile).permit!
  end

  def profile
    @profile ||= current_user.profile
  end
end
