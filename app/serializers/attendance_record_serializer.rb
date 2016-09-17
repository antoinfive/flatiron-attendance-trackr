class AttendanceRecordSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :student
end