class Week < ApplicationRecord
    belongs_to :user

    has_many :plans
    has_many :practices, through: :plans
end
