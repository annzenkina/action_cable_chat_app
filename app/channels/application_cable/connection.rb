module ApplicationCable
  class Connection < ActionCable::Connection::Base
    indentified_by :message_user

    def connect
      self.message_user = find_verified_user
    end

    private
      def find_verified_user
        if logged_in?
          current_user
        else
          reject_unauthorized_connection
        end
      end
    end

  end
end
