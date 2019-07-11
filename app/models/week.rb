class Week < ApplicationRecord
    belongs_to :user

    has_many :plans
    has_many :practices, through: :plans

    scope :past, -> { where(completed: true)}

    #show all of user's weeks that are completed

end
