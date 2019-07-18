class TipsController < ApplicationController
    before_action :require_login
  
    def new
      if Practice.exists?(params[:practice_id])
        @practice = Practice.find_by(id: params[:practice_id])
        @tip = @practice.tips.build(user_id: current_user.id)
      else
        redirect_to practices_path
      end
    end
  
    def create
      @tip = Tip.new(tip_params)
      if @tip.save
        redirect_to practice_path(@tip.practice)
      else
        render 'new'
      end
    end
  
    def edit
      @practice = Practice.find_by(id: params[:practice_id])
      if @practice.nil?
        redirect_to practices_path
      else
        @tip = @practice.tips.find_by(id: params[:id])
        redirect_to practice_path(@practice) if @tip.nil?
      end
    end
  
    def update
      @tip = Tip.find_by(id: params[:id])
      @tip.update(tip_params)
      redirect_to practice_path(@tip.practice)
    end
  
    def destroy
    end
  
    def like
      tip = Tip.find_by(id: params[:id])
      tip.like
      redirect_to practice_path(tip.practice)
    end

    private
      def tip_params
        params.require(:tip).permit(:user_id, :practice_id, :content)
      end
  end