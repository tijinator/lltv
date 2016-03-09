class UserSerializer < ActiveModel::Serializer
  self.root = false

  attributes :first_name, :last_name, :username, :email
end