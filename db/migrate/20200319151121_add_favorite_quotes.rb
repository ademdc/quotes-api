class AddFavoriteQuotes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :quotes
  end
end
