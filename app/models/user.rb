class User < ApplicationRecord
    has_many :weeks
    has_many :custom_practices, class_name: "Practice", foreign_key: "creator_id"
    has_many :practices, through: :weeks

    has_secure_password
    validates :email, :password, presence: true
    validates :email, uniqueness:{case_sensitive: false}

end
