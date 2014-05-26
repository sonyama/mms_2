class Admin::ProjectsController < ApplicationController
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new project_params   
    if @project.save
      flash[:success] = "Project Create!"
      redirect_to [:admin, @project]
    else
      render 'new'
    end
  end
  
  def index
    @projects = Project.paginate page: params[:page]
  end
  
  def show
    @project = Project.find params[:id]
    @project_manager = @project.manager    
  end
  
  def edit
    @project = Project.find params[:id]
    @user = User.all
    render 'edit'
  end
  
  def update
    @project = Project.find params[:id]
    if @project.update_attributes project_params
      flash[:success] = "Profile updated"
      redirect_to [:admin, @project]
    else
      render 'edit'
    end

  end
  
  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted."
    redirect_to admin_projects_url
  end
  
  private

    def project_params
      params.require(:project).permit(:name, :abbreviation, :start_date, :end_date,
                                            :team_id, :project_manager, :user_ids => [])
    end
end
