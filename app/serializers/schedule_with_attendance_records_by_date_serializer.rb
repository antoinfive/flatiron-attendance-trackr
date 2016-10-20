class ScheduleWithAttendanceRecordsByDateSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date
  has_many :attendance_records_by_date
  # root :date

  # def attendance_records_by_date
  #   self.object.attendance_records.pluck(:date).map do |date|
  #     records = AttendanceRecord.where(schedule: self.object, date: date) if date <= Date.today
  #     {date: date, attendance_records: records}
  #   end
  # end
  #
  def attendance_records_by_date
    records = self.object.attendance_records.order(date: :desc)
    filtered = records.map do |record| 
      (record if record.date <= Date.today)
    end
    filtered.compact 
  end 
end
