class Cohort < ApplicationRecord
  has_many :students, foreign_key: "cohort_id", class_name: "User"
  has_many :schedules
end

