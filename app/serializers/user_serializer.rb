class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :confirm password
end
