# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = check_user
    end

    private

    def check_user
      if verified_user = User.find_by(id: cookies.signed[:user])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
