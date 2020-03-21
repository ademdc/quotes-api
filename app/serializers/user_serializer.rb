class UserSerializer < ActiveModel::Serializer
  attributes :push_token, :id, :email
end