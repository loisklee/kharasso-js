class PracticesController < ApplicationController
  before_action :require_login, :current_user, :set_practice
  skip_before_action :require_login, :only => [:index]
  skip_before_action :set_practice, :only => [:index, :new, :create]


  def index
    @categorys = ["live", "love myself", "love my family, friends and neighbours", "love my enemies", "care for creation and our common home"]
    if params[:user_id] && current_user == User.find_by(id: params[:user_id])
      @practices = (current_user.custom_practices).push(*current_user.practices)
    else
     @practices = Practice.all
    end
    respond_to do |format|
      format.html {render :layout => "application"}
      format.json {render json: @practices}
    end
  end

  def new
    @categorys = ["live", "love myself", "love my family, friends and neighbours", "love my enemies", "care for creation and our common home"]
    @practice = current_user.custom_practices.build
    render :layout => "application"
  end


  def create
    @practice = Practice.new(practice_params)
    if @practice.save
      @practice.creator = current_user
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
    @last = Practice.last
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @practice}
    end
  end

  def destroy
    @practice.destroy
    redirect_to practices_path
  end

  private
  def practice_params
   params.require(:practice).permit(:name, :description, :category, :creator_id)
  end

end
