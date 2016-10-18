c = Cohort.create(name: "web-0717")
binding.pry
25.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, github_username: Faker::Internet.user_name, cohort: c)
end


["July 4th", "December 25th"].each do |day|
  Holiday.create(date: day.to_date)
end
binding.pry

Schedule.create(start_date: Date.today, end_date: Date.today + 90, cohort: Cohort.first)


