FactoryGirl.define do 
  factory :schedule do 
    start_date Date.today
    end_date Date.today + 90
  end
end

