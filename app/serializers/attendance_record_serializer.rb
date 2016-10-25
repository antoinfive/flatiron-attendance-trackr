class AttendanceRecordSerializer < ActiveModel::Serializer
  attributes :id, :date, :arrived_at, :arrived
  has_one :student
end