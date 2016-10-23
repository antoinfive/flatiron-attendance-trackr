class Cohort < ApplicationRecord
  has_many :students, foreign_key: "cohort_id", class_name: "User"
  has_one :schedule

  def attendance_records_by_date
    recs_by_date = []
    self.schedule.attendance_records.each do |ar|
      recs_by_date_with_this_date = recs_by_date.find { |recs_by_date_object| recs_by_date_object[:date] == ar.date}
      recs_by_date_with_this_date ? recs_by_date_with_this_date[:records] << ar : recs_by_date << {date: ar.date, records: [ar]}
    end 
    recs_by_date 
  end

end

