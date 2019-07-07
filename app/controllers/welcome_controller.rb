class WelcomeController < ApplicationController
    def home        
        @user = current_user
    end

    def about
        @user = current_user
    end
end
