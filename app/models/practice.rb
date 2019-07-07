class Practice < ApplicationRecord
    belongs_to :user
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    
    has_many :plans
    has_many :weeks, through: :plans

end
