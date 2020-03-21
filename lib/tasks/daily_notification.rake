require 'rake'

namespace :daily do
  desc "Send daily notification for all users"
  task notification: :environment  do
    Quote.send_daily_quote_notification
  end
end
