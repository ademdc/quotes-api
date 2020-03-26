require 'rake'

desc "Send daily notification for all users"
task daily: :environment  do
  Quote.daily
  puts Quote.daily.text
end
