class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :schedule_dates

  def schedule_dates
    self.object.attendance_records.pluck(:date).map do |date|
      records = AttendanceRecord.where(schedule: self.object, date: date) if date <= Date.today
      {date: date, attendance_records: records}
    end
  end
end

# {id: 1, 
#  days: [
#   {date: "Monday, Jul 1st",
#    attendance_records: [
#       sophie, 
#       antoin, 
#       chris
#     ]}
#  ]

# }