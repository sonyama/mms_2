class Project < ActiveRecord::Base
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  belongs_to :team
  validates :team_id, presence: true
  belongs_to :manager, foreign_key: 'project_manager', class_name: User

end
