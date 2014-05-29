class Admin::UsersController < ApplicationController
  
  after_action :log_update, only: [:create, :update, :destroy]

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Add user successly"
      redirect_to [:admin, @user]
    else
      @projects = Project.all
      render 'new'
    end
  end
  
  def new
    @user = User.new
    @projects = Project.all
  end

  def show
    @user = User.find params[:id]
    @position = Position.find @user.position_id
    @team = @user.team

  end

  def index
    @users = User.paginate page: params[:page]
    @teams = Team.all
  end
  
  def edit
    @projects = Project.all
    @teams = Team.all
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    
    if @user.update_attributes user_params
      flash[:success] = "Team updated"
      redirect_to [:admin, @user]
    else
      @projects = Project.all
      @teams = Team.all
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to admin_root_url
  end
  private

    def user_params
      params.require(:user).permit(:name, :dob, :team_id, :position_id, :email, :password,
                                   :password_confirmation, :project_ids=>[])
    end
    def admmin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
