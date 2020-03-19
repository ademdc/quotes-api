class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :category, :text, :author, :image_url
end