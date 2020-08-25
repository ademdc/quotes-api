class UserSerializer < ActiveModel::Serializer
  attributes :push_token, :id, :email, :first_name, :last_name
end