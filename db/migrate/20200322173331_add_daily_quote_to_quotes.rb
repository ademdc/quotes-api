class AddDailyQuoteToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :is_daily, :boolean, default: false
    add_column :quotes, :daily_for_date, :date, default: nil
  end
end
