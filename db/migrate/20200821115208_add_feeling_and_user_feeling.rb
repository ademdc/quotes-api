class AddFeelingAndUserFeeling < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |q|
      q.string      :name
      q.string      :image
      q.string      :color
      q.timestamps
    end

    create_table :user_feelings do |q|
      q.references  :user
      q.references  :feeling
      q.string      :message
      q.timestamps
    end
  end
end
