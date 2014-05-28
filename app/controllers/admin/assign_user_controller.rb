class Admin::AssignUserController < ApplicationController
   
  def edit
    @project = Project.find params[:id]
    @user = User.all
  end
  
  def update
    @project = Project.find params[:id]
    project_users = ProjectUser.find_project params[:id]
    if params[:user_ids].nil?
      project_users.each do |project_user|
      project_user.destroy
      end
    else
      project_users.each do |project_user|
        if !params[:user_ids].include? project_user.user_id
          project_user.destroy
        end
      end  
      params[:user_ids].each do |id|
        if project_users.find_user(id).blank?
          ProjectUser.create(user_id: id, project_id: params[:id])
        end
      end
    end    
    redirect_to [:admin, @project]    
  end
  
end
