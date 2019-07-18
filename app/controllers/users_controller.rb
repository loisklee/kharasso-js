class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def show
        if logged_in?
            @user = User.find_by(id: params[:id])
            redirect_to user_path(current_user) if @user != current_user
        else
            require_login
        end
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
