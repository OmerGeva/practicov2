class Challenge < ApplicationRecord
 belongs_to :user, :foreign_key => 'winner_id', optional: true
end
