class ViewCounter < ApplicationRecord
  belongs_to :user

  def self.today_for(user)
    self.where(user_id: user.id, created_at: Date.today.to_datetime).first_or_create!
  end

  def increment_count!
    update(count: self.incremented_count)
  end

  def incremented_count
    self.count += 1
  end
end