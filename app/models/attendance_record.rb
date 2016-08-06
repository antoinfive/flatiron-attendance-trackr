class AttendanceRecord < ApplicationRecord
  belongs_to :schedule
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
end
