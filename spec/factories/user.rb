FactoryGirl.define do
  factory :user do 
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    github_username Faker::Internet.user_name
    instructor false
  end

end
