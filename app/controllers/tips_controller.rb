    
class TipsController < ApplicationController
  before_action :require_login, :set_tip
  skip_before_action :set_tip, :only => [:index, :new, :create, :edit]

  def new
    if Practice.exists?(params[:practice_id])
      @practice = Practice.find_by(id: params[:practice_id])
      @tip = @practice.tips.build(user_id: current_user.id)
    else
      redirect_to practices_path
    end
  end

  def create
    tip = Tip.new(tip_params)
    if tip.save
      render json: tip, status: 201
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
      redirect_to practice_path(@practice) if @tip.nil? || !verify(@tip)
    end
  end

  def update
    @tip.update(tip_params)
    render json: @tip, status: 201
  end

  def like
    @tip.like
    render json: tip, status: 201
    my_path
  end

  def unlike
    @tip.unlike
    my_path
  end

  def destroy
    @tip = Tip.find_by(id: params[:id])
    @tip.destroy
    redirect_to practice_path(@tip.practice)    
  end
  
  private
    def tip_params
      params.require(:tip).permit(:user_id, :practice_id, :content, :likes)
    end

    def my_path
      set_tip
      redirect_to practice_path(@tip.practice)
    end
end