class UserMailer < ApplicationMailer
  def confirm_registration(user)
    @user = user

    mail to: @user.email, subject: 'Confirm registration in IMF'
  end
end
