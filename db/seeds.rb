c = Cohort.create(name: "web-0717")

25.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, github_username: Faker::Internet.user_name, cohort: c)
end
