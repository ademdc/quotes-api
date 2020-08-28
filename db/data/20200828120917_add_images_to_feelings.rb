class AddImagesToFeelings < ActiveRecord::Migration[5.2]
  def self.up
    feelings = {
      happy: 'https://cdn.shopify.com/s/files/1/1061/1924/products/Smiling_Emoji_with_Eyes_Opened_large.png?v=1571606036',
      normala: 'https://hotemoji.com/images/emoji/t/tgkksj9bi43t.png',
      worried: 'https://cdn.shopify.com/s/files/1/1061/1924/products/Worried_Face_Emoji_12fa1bbf-0297-4818-8298-d6c1a588c341_large.png?v=1571606036',
      angry: 'https://cdn.shopify.com/s/files/1/1061/1924/products/Angry_Face_Emoji_Icon_ios10_grande.png?v=1571606090',
      sad: 'https://i.pinimg.com/564x/a8/15/d6/a815d6f2edebb1eae33c8f6a7411c188.jpg',
      jelaous: 'https://i.dailymail.co.uk/i/pix/2016/04/20/10/335B57EA00000578-3549376-Are_you_triumphant_about_your_use_of_emoji_This_is_how_you_shoul-a-1_1461144171750.jpg',
      lonenly: 'https://i2.wp.com/legacy-church.org/wp-content/uploads/2017/11/lonely-emoji.png?resize=431%2C470&ssl=1',
      afraid: 'https://cdn.shopify.com/s/files/1/1061/1924/products/Fearful_Face_Emoji_large.png?v=1571606037',
      surprised: 'https://cdn.shopify.com/s/files/1/1061/1924/products/12_large.png?v=1571606116',
      excited: 'https://lh3.googleusercontent.com/proxy/ChjpD-ifAMCHXIYdo5wpUyPvUx0p2QUkVrd_IrdICGqhHll04Jq1WtO9q4vb8CVKcD5wpZxk359cxZ39Hncne3GalxpPaSlt4BwxmlQIphDo1g00IyuXjlCdWp3cb1ABwvH_dhfFjqaADJdxxnukgQ',
      busy: 'https://i.pinimg.com/originals/65/07/0b/65070b726b5852439ea58dce6e99dd8c.png',
      horny: 'https://i.pinimg.com/originals/23/ed/11/23ed1134a66295dd9d9435134f11cfa4.jpg'
    }

    feelings.each do |feeling, image|
      Feeling.find_by_name(feeling.titleize).update(image: image)
    end

  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
