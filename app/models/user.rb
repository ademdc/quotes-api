class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :view_counters

  def set_push_token(token)
    self.push_token = token
  end

  def todays_view_counter
    ViewCounter.where(user_id: self.id, created_at: Date.today.to_datetime).take
  end

  def increment_view_counter!
    counter = ViewCounter.today_for(self)
    counter.increment_count!
  end

  def favorite_quotes
    FavoriteQuote.by_user(self)
  end
end
