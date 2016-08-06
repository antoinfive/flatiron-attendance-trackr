class AttendanceRecordSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :schedule
  has_one :student
end