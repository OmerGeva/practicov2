class SkillCategoriesController < ApplicationController
  def index
    skill_categories = SkillCategory.all

    render json: {skill_categories: skill_categories}
  end
end
