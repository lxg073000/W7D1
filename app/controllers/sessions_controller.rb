class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        
        user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )
        if user 
            session[:session_token] = user.reset_session_token!
            fail
            current_user
            redirect_to cats_url
        else
            @user = User.new
            render :new
        end  
    end

    def destroy
        
        if logged_in?
            current_user.reset_session_token!
            session[:session_token] = nil
            @current_user = nil
            redirect_to new_session_url
        end
    end
end
