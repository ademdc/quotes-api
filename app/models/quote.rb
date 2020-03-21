class Quote < ApplicationRecord
  def self.favorites(user_id)
  end

  def self.send_daily_quote_notification
    client = Exponent::Push::Client.new
    messages = []

    User.where.not(push_token: nil).map do |user|
      messages.push({
        to: user.push_token,
        sound: 'default',
        title: 'New daily quote',
        body: 'Check out the daily quote from Mašnica'
      })
    end
    puts messages
    client.publish messages
  end

  def self.send_notification_to(user, sound:'default', body:'Test message')
    return unless user || user.push_token

    client = Exponent::Push::Client.new
    messages = [{
      to: user.push_token,
      sound: sound,
      body: body
    }]
    client.publish messages
  end
end