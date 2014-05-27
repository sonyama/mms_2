class Project < ActiveRecord::Base
  has_many :prousers, dependent: :destroy
  has_many :users, through: :prouser
  belongs_to :team
  validates :team_id, presence: true
  accepts_nested_attributes_for :users
end
