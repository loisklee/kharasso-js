class User < ApplicationRecord
    has_many :weeks
    has_many :custom_practices, class_name: "Practice", foreign_key: "creator_id"
    has_many :practices, through: :weeks
    has_many :tips

    has_secure_password
    validates :name, :email, :password, presence: true
    validates :email, uniqueness:{case_sensitive: false}

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash["info"]["email"]).first_or_create do |u|
         u.email = auth_hash.info.email
         u.password = SecureRandom.hex
       end
    end
end
