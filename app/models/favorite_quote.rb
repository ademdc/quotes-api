class FavoriteQuote < ApplicationRecord
  belongs_to :user
  belongs_to :quote

  self.table_name = :quotes_users

  scope :by_user, -> (user) { where(user_id: user.id) }
end
