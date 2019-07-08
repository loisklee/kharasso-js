class Practice < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"

    has_many :plans
    has_many :weeks, through: :plans

    validates :name, presence: true, uniqueness:{case_sensitive: false}
    validates :category, presence: {:message => 'cannot be blank, practice cannot be saved.'}

    def self.categorize_by(category)
        Practice.all.where(:category => category)
    end
end
