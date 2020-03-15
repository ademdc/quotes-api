class AddQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |q|
      q.string :title
      q.string :quote
      q.timestamps
    end
  end
end