class Project < ActiveRecord::Base
  has_many :prousers, dependent: :destroy
  belongs_to :team
  validates :team_id, presence: true
end
