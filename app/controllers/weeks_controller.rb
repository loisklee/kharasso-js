class WeeksController < ApplicationController
    before_action :require_login

    def new
      verify_user
      @week = current_user.weeks.new
    end
end
