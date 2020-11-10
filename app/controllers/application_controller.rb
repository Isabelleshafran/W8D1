class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    helper_method :logged_in?, :current_user

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def login!(user)
        @current_user = user  #if we run into errors review this 
        session[:session_token] = user.reset_session_token!
    end

    def logout
        current_user.reset_session_token!
        session[:session_token] = nil 
        @current_user = nil
    end

    def require_logged_in 
        redirect_to new_session_url unless logged_in?
    end

    # def is_moderator?(sub)
    #     #want to check if current user session is = user id and moderator id
    #     #user = User.find_by(session_token: session[:session_token])
    #     #user.id == moderator_id
    #     current_user.id == sub.moderator_id
    # end

end
