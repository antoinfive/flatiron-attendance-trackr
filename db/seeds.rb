c = Cohort.create(name: "web-0717")
25.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, github_username: Faker::Internet.user_name, cohort: c)
end


["July 4th", "December 25th"].each do |day|
  Holiday.create(date: day.to_date)
end

Schedule.create(start_date: Date.today - 60, end_date: Date.today, cohort: Cohort.first)



AttendanceRecord.all.each do |rec|
  rec.arrived_at = rec.date
  rec.arrived = true
  rec.save
end

5.times do 
  random_date = AttendanceRecord.all.sample.date
  AttendanceRecord.where(date: random_date).each do |rec|
    rec.arrived_at = nil
    rec.arrived = false
    rec.save
  end
end
