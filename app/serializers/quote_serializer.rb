class QuoteSerializer < ActiveModel::Serializer
  attributes :category, :text, :author
end