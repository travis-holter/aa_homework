class Api::SessionController < ApplicationController
    def create
        # debugger
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user.nil?
            # debugger
            render json: ['Invalid credentials'], status: 401
        else
            # debugger
            login!(@user)
            render 'api/users/show'
        end
    end

    def destroy
        if logout!
            render json: {}
        else
            render json: @user.errors.full_messages, status: 404
        end
    end
end
