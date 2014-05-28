class Admin::SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find_by params[:id]
  end


  def new
    @skill = Skill.new
  end

  def edit
    @skill = Skill.find_by params[:id]
  end


  def create
    @skill = Skill.new skill_params   
    if @skill.save
      flash[:success] = "Skill Create!"
      redirect_to [:admin, @skill]
    else
      render 'new'
    end
  end


  def update
    @skill = Skill.find params[:id]
    if @skill.update_attributes skill_params
      flash[:success] = "Skill updated"
      redirect_to [:admin, @skill]
    else
      render 'edit'
    end
  end


  def destroy
    Skill.find(params[:id]).destroy
    flash[:success] = "Skill deleted."
    redirect_to admin_skills_url
  end

  private

    def skill_params
      params.require(:skill).permit(:name)
    end
end
