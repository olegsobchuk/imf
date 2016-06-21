class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    binding.pry
  end

  def destroy
  end
end
