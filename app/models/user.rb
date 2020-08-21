class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :view_counters
  has_many :user_feelings
  has_one  :partner

  def set_push_token(token)
    self.push_token = token
  end

  def companion
    User.find(self.partner.partner_id) rescue nil
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

  def partner_up_with!(user)
    Partner.where(user_id: self.id, partner_id: user.id, active: true).first_or_create!
  end

  def deactivate_other_partners
    Partner.where(user_id: self.id).update(active: false)
  end
end
