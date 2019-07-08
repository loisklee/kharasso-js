class SessionsController < ApplicationController

    def new
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
      if auth_hash = request.env["omniauth.auth"]
        @user = User.find_or_create_by_omniauth(auth_hash)
        login
      else
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          login
        else
          flash[:danger] = 'invalid email/password combination! try again or sign up below.'
          redirect_to '/login'
        end
      end
    end
    
    private
    def login
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
    
end