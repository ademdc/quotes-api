class AddImageUrlToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :image_url, :string
  end
end
