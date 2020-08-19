class AddViewCounter < ActiveRecord::Migration[5.2]
  def change
    create_table :view_counters do |q|
      q.references :user
      q.integer    :count, default: 0
      q.timestamps
    end
  end
end
