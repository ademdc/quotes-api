class UserFeeling < ApplicationRecord
  belongs_to :user
  belongs_to :feeling

  scope :for_user, -> (user_id) { where(user_id: user_id) }
end