class WeekSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :practices, :completed, :user_id
  belongs_to :user
  has_many :practices, serializer: WeekPracticeSerializer
end
