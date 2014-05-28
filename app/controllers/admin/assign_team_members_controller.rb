class Admin::AssignTeamMembersController < ApplicationController
  def edit
    @team = Team.find params[:team_id]
    @users = User.all
  end
  
  def update
    @team = Team.find params[:team_id]
    team_users = @team.users
    if params[:user_ids].nil?
      team_users.each do |team_user|
        team_user.update(team_id: nil)
      end
    else
      team_users.each do |team_user|
        if !params[:user_ids].include? team_user.id
          team_user.update_attribute(:team_id, nil)
        end
      end
      params[:user_ids].each do |user_id|
        if team_users.find_by_id(user_id).blank?
          User.find_by_id(user_id).update_attribute(:team_id, @team.id)
        end
      end
    end    
    redirect_to [:admin, @team]    
  end
end
