class Practice < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :check_ins
end
