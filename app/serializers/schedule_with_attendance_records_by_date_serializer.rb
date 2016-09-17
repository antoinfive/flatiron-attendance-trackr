class ScheduleWithAttendanceRecordsByDateSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :attendance_records_by_date

  def attendance_records_by_date
    self.object.attendance_records.pluck(:date).map do |date|
      records = AttendanceRecord.where(schedule: self.object, date: date) if date <= Date.today
      {date: date, attendance_records: records}
    end
  end
end