class Practice < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"

    has_many :plans
    has_many :weeks, through: :plans
    has_many :tips

    validates :name, presence: true, uniqueness:{case_sensitive: false}
    validates :category, presence: {:message => 'cannot be blank, practice cannot be saved.'}

    scope :categorize_by, -> (c){ where(category: c)}

end
