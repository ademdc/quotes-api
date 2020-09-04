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

  desc "Updates images of each feeling"
  task update_images: :environment do
    feelings = {
      happy: 'https://cdn.shopify.com/s/files/1/1061/1924/products/Smiling_Emoji_with_Eyes_Opened_large.png?v=1571606036',
      normala: 'https://hotemoji.com/images/emoji/i/17zcrtb1w5vc7i.png',
      worried: 'https://cdn.shopify.com/s/files/1/1061/1924/products/Worried_Face_Emoji_12fa1bbf-0297-4818-8298-d6c1a588c341_large.png?v=1571606036',
      angry: 'https://cdn.shopify.com/s/files/1/1061/1924/products/Angry_Face_Emoji_Icon_ios10_grande.png?v=1571606090',
      sad: 'https://hotemoji.com/images/emoji/r/g0i0936t34lr.png',
      jelaous: 'https://hotemoji.com/images/emoji/m/17zcrtbmx9mkm.png',
      lonely: 'https://hotemoji.com/images/emoji/w/g0i093hsj1xw.png',
      afraid: 'https://cdn.shopify.com/s/files/1/1061/1924/products/Fearful_Face_Emoji_large.png?v=1571606037',
      surprised: 'https://cdn.shopify.com/s/files/1/1061/1924/products/12_large.png?v=1571606116',
      excited: 'https://hotemoji.com/images/emoji/n/17zcrtb1tivurn.png',
      busy: 'https://hotemoji.com/images/emoji/s/w2zcr2fkj7ms.png',
      horny: 'https://hotemoji.com/images/emoji/r/tgkksj6t34lr.png'
    }

    feelings.each do |feeling, image|
      Feeling.find_by_name(feeling.to_s.titleize).update(image: image)
    end

    puts 'All done...'
  end
end