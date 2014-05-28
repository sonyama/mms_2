class Team < ActiveRecord::Base
  has_many :users
  validates :description, presence: true, length: { maximum: 300 }
  accepts_nested_attributes_for :users
end
