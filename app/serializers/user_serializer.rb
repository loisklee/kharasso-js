class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :weeks
  has_many :practices
  has_many :custom_practices
  has_many :tips
end
