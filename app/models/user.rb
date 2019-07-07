class User < ApplicationRecord
    has_many :weeks
    has_many :practices, through weeks
    has_many :custom_practices, class_name: "Practice", foreign_key: "creator_id"
end
