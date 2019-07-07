class SessionsController < ApplicationController

    def new
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private
    def login
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
    
end