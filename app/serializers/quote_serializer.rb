class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :category, :text, :author, :image_url, :daily_for_date, :is_daily
end