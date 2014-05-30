class ProjectsController < ApplicationController
  
  after_action :log_update, only: [:create, :update, :destroy]
  
  def index
    @projects = Project.paginate page: params[:page]
  end
  
  def show
    @project = Project.find params[:id]
    @project_manager = @project.manager    
  end
  
end
