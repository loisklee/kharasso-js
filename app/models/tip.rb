class Tip < ApplicationRecord
    belongs_to :practice
    belongs_to :user

    validates :practice_id, :user_id, :content, presence: true
    scope :top_tip, -> { order("likes desc") }

    def like
        self.likes += 1
        save
    end
end
