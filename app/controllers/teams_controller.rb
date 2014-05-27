class Admin::TeamsController < ApplicationController
  
  def index
    @teams = Team.paginate page: params[:page]
  end
  
  def show
    @team = Team.find params[:id]
    @users = @team.users.paginate page: params[:page]
  end
  
  def new
    @team = Team.new
  end

  def create
    @team = Team.new team_params   
    if @team.save
      flash[:success] = "Add team successly"
      redirect_to [:admin, @team]
    else
      render 'new'
    end
  end
  
  def edit
    @team = Team.find params[:id]
    @users = User.all
  end
  
  def update
    @team = Team.find params[:id]
    if @team.update_attributes team_params
      flash[:success] = "Team updated"
      redirect_to [:admin, @team]
    else
      render 'edit'
    end
  end
  
  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team deleted."
    redirect_to root_url
  end

  private

    def team_params
      params.require(:team).permit(:name, :description, :leader)
    end
    def admmin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
