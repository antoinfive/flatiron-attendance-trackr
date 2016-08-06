class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date
  has_one :cohort
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