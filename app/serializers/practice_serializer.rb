class PracticeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :creator_id
  has_many :tips
  has_many :weeks
end
