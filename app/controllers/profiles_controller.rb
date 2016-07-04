class ProfilesController < ApplicationController
  before_action :require_user

  def avatar
    profile.avatar = params[:avatar]
    if profile.valid? && profile.save
    else
      flash[:avatar] = 'Wrong avatar upload'
    end
    redirect_to :back
  end

  private

  def profile_params
    params.require(:profile).permit!
  end

  def profile
    @profile ||= current_user.profile
  end
end
