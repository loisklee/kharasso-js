class WeeksController < ApplicationController
  before_action :require_login

  def new
    verify_user
    @week = current_user.weeks.new
  end

  def create
    @week = Week.new(week_params)
    if @week.save
      current_user.weeks << @week
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    verify_user
    @week = current_user.weeks.find_by(id: params[:id])
    redirect_to user_path(current_user) if @week.nil? || !verify(@week)
  end

  def update
    set_week
    @week.update(week_params)
    redirect_to user_path(current_user)
  end

  def destroy
    set_week
    @week.plans.destroy_all
    @week.destroy
    redirect_to user_path(current_user)
  end
  
  def past
    @weeks = Week.past.where(user_id: current_user.id)
  end
  private
  
  def week_params
    params.require(:week).permit(:start_date, :user_id, :completed, practice_ids:[])
  end

  def verify_user
    redirect_to user_path(current_user) if !User.exists?(params[:user_id]) || current_user != User.find(params[:user_id])
  end
end