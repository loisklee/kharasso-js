class Plan < ApplicationRecord
    belongs_to :week
    belongs_to :practice
end
