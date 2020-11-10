class Skill < ApplicationRecord
  belongs_to :skill_category

  has_many :practices
end
