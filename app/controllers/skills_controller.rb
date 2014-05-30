class SkillsController < ApplicationController
  
  after_action :log_update, only: [:create, :update, :destroy]

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find_by params[:id]
  end

end
