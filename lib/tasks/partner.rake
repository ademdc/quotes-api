require 'rake'

namespace :partner do
  desc "Partner up two users"
  task up: :environment  do
    ARGV.each { |a| task a.to_sym do ; end }
    user1, user2 = User.find(ARGV[1]), User.find(ARGV[2])

    user1.partner_up_with!(user2)
    user2.partner_up_with!(user1)

    puts "Successfully partnered up #{user1.email} with #{user2.email}"
  end
end
