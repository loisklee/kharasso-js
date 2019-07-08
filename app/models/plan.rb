class Plan < ApplicationRecord
    belongs_to :week
    belongs_to :practice

    accepts_nested_attributes_for :week, reject_if: :reject_week
  
    def reject_week(attributes)
      attributes['start_date'].blank?
    end
end
