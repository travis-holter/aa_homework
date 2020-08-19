class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            login_user!(user)
            redirect_to users_url
        else
            flash.now[:errors] = ["Invalid Credentials"]
            render :new, status: 422
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end
