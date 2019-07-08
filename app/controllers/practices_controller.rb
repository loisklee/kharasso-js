class PracticesController < ApplicationController
  before_action :require_login, :current_user, :set_practice
  skip_before_action :require_login, :only => [:index, :show]
  skip_before_action :set_practice, :only => [:index, :new, :create]


  def index
    @categorys = ["live", "love myself", "love my family, friends and neighbours", "love my enemies", "care for creation and our common home"]
    if params[:user_id] && current_user == User.find_by(id: params[:user_id])
      @practices = (current_user.custom_practices).push(*current_user.practices)
    else
      @practices = Practice.all
    end
    render :layout => "application"

  end


  def new
    @categorys = ["live", "love myself", "love my family, friends and neighbours", "love my enemies", "care for creation and our common home"]
    @practice = current_user.custom_practices.build
    render :layout => "application"
  end


  def create
    @practice = Practice.new(practice_params)
    if @practice.save
      redirect_to practice_path(@practice)
    else
      render 'new'
    end
  end

  def edit
    @categorys = ["live", "love myself", "love my family, friends and neighbours", "love my enemies", "care for creation and our common home"]
    render :layout => "application"
  end

  def update
    @practice.update(practice_params)
    redirect_to practice_path(@practice)
  end

  def show
  end

  def destroy
    @practice.destroy
    redirect_to practices_path
  end

  def self.categorize_by(category)
    Practice.all.where(:category => category)
end

private
  def practice_params
    params.require(:practice).permit(:name, :category, :creator_id)
  end

end
