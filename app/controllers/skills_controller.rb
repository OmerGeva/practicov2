class SkillsController < ApplicationController
  def index
    skills = Skill.all

    render json: {skills: skills}
  end
end
