class Admin::PositionsController < ApplicationController
  
  after_action :log_update, only: [:create, :update, :destroy]
  
  def new
    @position = Position.new
  end
  
  def create
    @position = Position.new position_params   
    if @position.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to [:admin, @position]
    else
      render 'new'
    end
  end
  
  def index
    @positions = Position.paginate page: params[:page]
  end
  
  def show
    @position = Position.find params[:id]
    @users = @position.users.paginate page: params[:page]
  end
  
  def edit
    @position = Position.find params[:id]
    render 'edit'
  end
  
  def update
    @position = Position.find params[:id]
    if @position.update_attributes position_params
      flash[:success] = "Profile updated"
      redirect_to [:admin, @position]
    else
      render 'edit'
    end
  end
  
  def destroy
    Position.find(params[:id]).destroy
    flash[:success] = "Position deleted."
    redirect_to root_url
  end
  
  private

    def position_params
      params.require(:position).permit(:name, :abbreviation)
    end
end
