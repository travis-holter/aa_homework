class ApplicationController < ActionController::Base
    helper_method :current_user

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user # saves a query to db
    end

    def logout!
        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
    end


    def current_user
        @current_user ||= User.find_by( session_token: session[:session_token] )
    end

    def logged_in?
        # !! is shortcut to convert something into a boolean (double negative makes a positive)
        !!current_user # returns true unless current_user returns nil (no user with matching session_token)
    end

    def ensure_logged_in
        if logged_in?
            redirect_to cats_url 
        else
            redirect_to new_session_url
        end
    end

    def ensure_owns_cat
        if !(current_user.id == cat.owner.id)
            redirect_to cats_url
        end
    end
end
