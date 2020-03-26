set :output, "log/cron.log"

every :hour do
  runner "Quote.daily"
end

every 1.day, at: '08:00 am' do
  runner "Quote.send_daily_quote_notification"
end