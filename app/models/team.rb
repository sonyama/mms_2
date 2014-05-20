class Team < ActiveRecord::Base
  has_many :users, dependent: :destroy
  validates :description, presence: true, length: { maximum: 300 }
end
