set :output, "log/cron.log"

every :hour do
  runner "Quote.send_daily_quote_notification"
end

every 1.day, at: '22:40 pm' do
  runner "Quote.send_daily_quote_notification"
end