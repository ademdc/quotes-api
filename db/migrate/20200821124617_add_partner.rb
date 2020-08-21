class AddPartner < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |q|
      q.references  :user
      q.integer     :partner_id
      q.boolean     :active, default: true
      q.timestamps
    end
  end
end
