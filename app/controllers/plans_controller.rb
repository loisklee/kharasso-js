class PlansController < ApplicationController
    before_action :require_login

    def new
      if !Practice.exists?(params[:practice_id])
        redirect_to practices_path
      else
        @plan = Plan.new(practice_id: params[:practice_id])
        @plan.build_week(user_id: current_user.id)
      end
    end
  
    def create
      @plan = Plan.create(plan_params)
      redirect_to user_path(current_user)
    end
  
    def destroy
      @plan =  Plan.find_by(id: params[:id])
      @plan.destroy
      redirect_to user_path(current_user)
    end
  
    private
  
    def plan_params
      params.require(:plan).permit(:practice_id, :start_date, :week_id, week_attributes: [:start_date, :user_id])
    end
end
