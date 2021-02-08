class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        user = User.find_by_credentials(user_name, password)
        if user 
            session[:session_token] = user.reset_session_token
            redirect_to cats_url
        else
            render :new
        end  
    end
end