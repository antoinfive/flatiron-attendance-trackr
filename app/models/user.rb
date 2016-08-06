class User < ApplicationRecord
  belongs_to :cohort
  has_many :attendance_records
end


