class UserFeeling < ApplicationRecord
  belongs_to :user
  belongs_to :feeling

  scope :for_user, -> (user_id) { where(user_id: user_id) }
  scope :for_period, -> (period) { where('created_at > ?', period ) }
end