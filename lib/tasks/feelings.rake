namespace :feelings do
  desc "Creates feelings to database"
  task create: :environment do
    ActiveRecord::Base.transaction do
      feelings = [
        {
          name: 'Happy',
          color: '#f5428d'
        },
        {
          name: 'Normala',
          color: '#f54242'
        },
        {
          name: 'Worried',
          color: '#f5a442'
        },
        {
          name: 'Angry',
          color: '#f5d142'
        },
        {
          name: 'Sad',
          color: '#41d95d'
        },
        {
          name: 'Jelaous',
          color: '#9eecff'
        },
        {
          name: 'Lonely',
          color: '#b9ffb0'
        },
        {
          name: 'Afraid',
          color: '#ffc7ff'
        },
        {
          name: 'Surprised',
          color: '#8fd3ed'
        },
        {
          name: 'Excited',
          color: '#aafdd3'
        },
        {
          name: 'Busy',
          color: '#86cdf4'
        },
        {
          name: 'Horny',
          color: '#368dff'
        }
      ]
      Feeling.create(feelings)
    end
    puts "All done now!"
  end
end