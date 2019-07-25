class TipSerializer < ActiveModel::Serializer
  attributes :id, :content, :likes, :user_id, :practice_id
  belongs_to :practice
  belongs_to :user
end
