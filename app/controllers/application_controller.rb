class ApplicationController < ActionController::Base
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def require_login
      redirect_to '/login' unless logged_in?
    end

    def verify(instance)
      instance.user == current_user
    end

    def set_week
      @week = Week.find_by(id: params[:id])
    end

    def set_practice
      @practice = Practice.find_by(id: params[:id])
    end

    def set_tip
      @tip = Tip.find_by(id: params[:id])
    end
end