class Quote < ApplicationRecord
  def self.favorites(user_id)
  end

  def self.daily
    quote_of_day = Quote.of_day

    if quote_of_day.present?
      return quote_of_day if quote_of_day.is_todays_daily_quote?
    end

    return Quote.all.sample unless Quote.where(daily_for_date: nil).present?

    new_quote = Quote.where(daily_for_date: nil).sample
    new_quote.set_daily!
    new_quote
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

  def self.of_day
    Quote.where(is_daily: true).first
  end

  def set_daily!
    Quote.where(is_daily: true).update_all(is_daily: false)
    self.update(daily_for_date: Date.today.to_date, is_daily: true)
  end

  def is_todays_daily_quote?
    self.daily_for_date.to_date == Date.today.to_date
  end
end