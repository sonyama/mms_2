class ProjectUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  scope :find_project, -> (project_id) {where project_id: project_id}
  scope :find_user, -> (user_id) {where user_id: user_id}
  end
