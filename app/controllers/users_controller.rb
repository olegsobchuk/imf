class UsersController < ApplicationController
  before_action :require_user

  def show
    @profile = current_user.profile
  end
end
