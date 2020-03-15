class AddAuthorToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :author, :string
    remove_column :quotes, :quote
    add_column :quotes, :text, :string
  end
end
