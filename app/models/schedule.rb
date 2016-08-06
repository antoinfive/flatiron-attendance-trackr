class Schedule < ApplicationRecord
  has_many :attendance_records
  belongs_to :cohort
  validate :end_date_is_after_start_date

  after_create :generate_attendance_records

  WEEKEND_DAYS = ['Saturday', 'Sunday']

  def generate_attendance_records
    weekdays_that_arent_holidays.each do |day|
      User.where(instructor: false, cohort: self.cohort).each do |student|
        AttendanceRecord.create(student: student, date: day, schedule: self)
      end
    end
  end

  def end_date_is_after_start_date
    errors.add(:end_date, "must be after start date") if end_date <= start_date
  end

  def days
    (start_date.to_date..end_date.to_date).to_a
  end

  def weekdays
    days.select { |day| !WEEKEND_DAYS.include?(day.strftime("%A")) }
  end

  def weekdays_that_arent_holidays
    weekdays - Holiday.all.pluck(:date)
  end
end
