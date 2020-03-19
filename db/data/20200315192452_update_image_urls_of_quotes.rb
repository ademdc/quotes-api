class UpdateImageUrlsOfQuotes < ActiveRecord::Migration[5.2]
  def self.up
    Quote.update_all(image_url: 'https://www.tacno.net/wp-content/uploads/2013/11/love-couple-beach-kiss-kissing-hot-couple-in-sun-shine-love-images-download-romantic-love-images-download-lonelyness-alone-www.143loveu.blogspot.in_.jpg')
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
